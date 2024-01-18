import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_new/data/network_caller.dart';

import '../../data/models/task.dart';
import '../../data/network_response.dart';
import '../../utility/urls.dart';

enum TaskStatus { New, Progress, Completed, Canceled }

class Items_card extends StatefulWidget {
  const Items_card({
    super.key,
    required this.task, required this.onStatusChange, required this.showStatusProgress,
  });

  final Task task;
  ///Task select korar pore refresh dekhanor upay
  final VoidCallback onStatusChange;
  final Function(bool) showStatusProgress;

  @override
  State<Items_card> createState() => _Items_cardState();
}

class _Items_cardState extends State<Items_card> {
  Future<void> updateTaskStatus(String status) async {
    widget.showStatusProgress(true);
    final NetworkResponse response=await NetworkCaller().getRequest(Urls.updateTaskStatus(widget.task.sId ??"", status) );
if(response.isSuccess){
  widget.onStatusChange();

};
widget.showStatusProgress(false);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ///??(double questioins) diye bujhay if ''(null)
              widget.task.title ?? '',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              widget.task.description ?? '',
            ),
            SizedBox(
              height: 15,
            ),
            Text('Date:${widget.task.createdDate}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(
                    widget.task.status ?? 'New',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.blue,
                ),
                Wrap(
                  children: [

                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        showUpdateStatusModel();
                      },
                      icon: Icon(
                        Icons.edit,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void showUpdateStatusModel() {
    List<ListTile> items = TaskStatus.values
        .map(
          (e) => ListTile(
            title: Text("${e.name}"),
            onTap: () {
              updateTaskStatus(e.name);
              Navigator.pop(context);
            },
          ),
        )
        .toList();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: items,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel')),
          ],
        );
      },
    );
  }
}
