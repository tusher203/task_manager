import 'package:flutter/material.dart';
import 'package:task_manager_new/UI/UI_Screens/add_new_task_screen.dart';
import 'package:task_manager_new/UI/UI_Widgets/item_cards.dart';
import 'package:task_manager_new/data/models/task_list_model.dart';
import 'package:task_manager_new/data/network_caller.dart';
import 'package:task_manager_new/utility/urls.dart';
import 'package:task_manager_new/data/network_response.dart';

import '../../data/models/task_count.dart';
import '../../data/models/task_count_listmodel.dart';
import '../UI_Widgets/profile_summary_screen.dart';
import '../UI_Widgets/summary_card_screen.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  bool getNewTaskProgress = false;
  bool getCountTaskProgress = false;
  TaskListModel taskListModel = TaskListModel();
  TaskCountSummaryList taskCountSummaryList = TaskCountSummaryList();

  Future<void> getNewCountList() async {
    getCountTaskProgress = true;

    setState(() {});
    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.taskCount);
    if (response.isSuccess) {
      taskCountSummaryList =
          TaskCountSummaryList.fromJson(response.jsonResponse ?? {});
    }
    getCountTaskProgress = false;
    setState(() {});
  }

  Future<void> getNewTaskList() async {
    getNewTaskProgress = true;
    if (mounted) {
      setState(() {});
      final NetworkResponse response =
      await NetworkCaller().getRequest(Urls.listTask);
      if (response.isSuccess) {
        taskListModel = TaskListModel.fromJson(response.jsonResponse ?? {});
      }
      getNewTaskProgress = false;
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getNewCountList();
    getNewTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddNewTaskScreen()));
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const profile_summary(),
            Visibility(
              visible: getCountTaskProgress == false &&
                  (taskCountSummaryList.taskCountList?.isNotEmpty ?? false),
              replacement: const LinearProgressIndicator(),
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: taskCountSummaryList.taskCountList?.length ?? 0,
                    itemBuilder: (context, index) {
                      TaskCount taskCount =
                      taskCountSummaryList.taskCountList![index];
                      return FittedBox(
                        child: SummaryCard(
                          title: taskCount.sId.toString(),
                          count: taskCount.sum.toString(),
                        ),
                      );
                    }),
              ),
            ),
            Expanded(
              child: Visibility(
                visible: getNewTaskProgress == false,
                replacement: const Center(child: CircularProgressIndicator()),
                child: RefreshIndicator(
                  onRefresh: (getNewTaskList),
                  child: ListView.builder(
                      itemCount: taskListModel.taskList?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Items_card(
                          onStatusChange: () {
                            getNewTaskList();
                          },
                          showStatusProgress: (inProgress) {
                            getNewTaskProgress=inProgress;
                            if(mounted){
                              setState(() {

                              });
                            }
                          },

                          task: taskListModel.taskList![index],
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
