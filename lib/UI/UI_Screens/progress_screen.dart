import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:task_manager_new/UI/UI_Widgets/profile_summary_screen.dart';
import 'package:task_manager_new/data/models/task_list_model.dart';
import 'package:task_manager_new/data/network_caller.dart';
import 'package:task_manager_new/data/network_response.dart';

import '../../utility/urls.dart';
import '../UI_Widgets/item_cards.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  bool getProgressTaskProgress = false;
  TaskListModel taskListModel = TaskListModel();

  Future<void> getProgressTaskList() async {
    getProgressTaskProgress = true;
    if (mounted) {
      setState(() {});
      final NetworkResponse response =
      await NetworkCaller().getRequest(Urls.getProgressTask);
      if (response.isSuccess) {
        taskListModel = TaskListModel.fromJson(response.jsonResponse ?? {});
      }
      getProgressTaskProgress = false;
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getProgressTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(

          children: [
            const profile_summary(),
            Expanded(
              child: Visibility(
                visible: getProgressTaskProgress == false,
                replacement: const Center(child: CircularProgressIndicator()),
                child: RefreshIndicator(
                  onRefresh: (getProgressTaskList),
                  child: ListView.builder(
                      itemCount: taskListModel.taskList?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Items_card(
                          onStatusChange: () {
                            getProgressTaskList();
                          },
                          showStatusProgress: (inProgress) {
                            getProgressTaskProgress=inProgress;
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
