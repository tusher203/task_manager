import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/ui.widgets/background.dart';
import 'package:task_manager/ui/ui_screen/update_profile.dart';

import '../ui.widgets/profile_summary.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key});

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Column(
        children: [
          ProfileSummary(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: backgroundclr_screen(
              Logo: Column(
                children: [
                  Text(
                    "Add New Task",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: "Subject"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(hintText: "Description"),
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateProfie(),
                              ),
                            );
                          },
                          child: Icon(Icons.arrow_circle_right_outlined)))
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
