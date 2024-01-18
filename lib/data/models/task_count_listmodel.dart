import 'package:task_manager_new/data/models/task_count.dart';

class TaskCountSummaryList {
  String? status;
  List<TaskCount>? taskCountList;

  TaskCountSummaryList({this.status, this.taskCountList});

  TaskCountSummaryList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      taskCountList = <TaskCount>[];
      json['data'].forEach((v) {
        taskCountList!.add( TaskCount.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    if (this.taskCountList != null) {
      data['data'] = this.taskCountList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

