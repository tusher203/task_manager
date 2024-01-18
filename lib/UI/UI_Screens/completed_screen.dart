import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_new/UI/UI_Widgets/background_scr.dart';
import 'package:task_manager_new/UI/UI_Widgets/profile_summary_screen.dart';
import 'package:task_manager_new/data/models/task_list_model.dart';
import 'package:task_manager_new/data/network_caller.dart';
import 'package:task_manager_new/data/network_response.dart';

import '../../utility/urls.dart';
import '../UI_Widgets/item_cards.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  bool getCompletedTaskProgress=false;
  TaskListModel taskListModel=TaskListModel();
  Future<void>getCompletedTask() async {
    getCompletedTaskProgress=true;
    if(mounted){
      setState(() {
        
      });
    }
    NetworkResponse response=await NetworkCaller().getRequest(Urls.getCompletedTask);
    if(response.isSuccess){
      taskListModel=TaskListModel.fromJson(response.jsonResponse?? {});
    }
    getCompletedTaskProgress=false;
    if(mounted){
      setState(() {

      });
    }
  }
  @override
  void initState(){
    super.initState();
    getCompletedTask();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         const profile_summary(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Visibility(
                      visible: getCompletedTaskProgress == false,
                      replacement: const Center(child: CircularProgressIndicator()),
                      child: RefreshIndicator(
                        onRefresh: (getCompletedTask),
                        child: ListView.builder(
                            itemCount: taskListModel.taskList?.length ?? 0,
                            itemBuilder: (context, index) {
                              return Items_card(
                                onStatusChange: () {
                                  getCompletedTask();
                                },
                                showStatusProgress: (inProgress) {
                                  getCompletedTaskProgress=inProgress;
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
          ),
        ],
      ),
    );
  }
}
