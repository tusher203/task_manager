import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:task_manager_new/UI/UI_Widgets/profile_summary_screen.dart';
import 'package:task_manager_new/data/models/task_list_model.dart';
import 'package:task_manager_new/data/network_caller.dart';
import 'package:task_manager_new/data/network_response.dart';

import '../../utility/urls.dart';
import '../UI_Widgets/item_cards.dart';

class CancelScreen extends StatefulWidget {
  const CancelScreen({super.key});

  @override
  State<CancelScreen> createState() => _CancelScreenState();
}

class _CancelScreenState extends State<CancelScreen> {
  bool getCanceledTaskProgress = false;
  TaskListModel taskListModel = TaskListModel();

  Future<void> CancelTaskList() async {
    getCanceledTaskProgress = true;

    if (mounted) {
      setState(() {});
      NetworkResponse response =
          await NetworkCaller().getRequest(Urls.getCanceledTask);
      if (response.isSuccess) {
        taskListModel = TaskListModel.fromJson(response.jsonResponse ?? {});
      }
      getCanceledTaskProgress = false;
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    super.initState();
    CancelTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          profile_summary(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Visibility(
                      visible: getCanceledTaskProgress == false,
                      replacement:
                          const Center(child: CircularProgressIndicator()),
                      child: RefreshIndicator(
                        onRefresh: (CancelTaskList),
                        child: ListView.builder(
                            itemCount: taskListModel.taskList?.length ?? 0,
                            itemBuilder: (context, index) {
                              return Items_card(
                                onStatusChange: () {
                                  CancelTaskList();
                                },
                                showStatusProgress: (inProgress) {
                                  getCanceledTaskProgress = inProgress;
                                  if (mounted) {
                                    setState(() {});
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
          ),
        ],
      ),
    );
  }
}
