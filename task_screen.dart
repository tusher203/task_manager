import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/ui.widgets/item_card.dart';
import 'package:task_manager/ui/ui.widgets/profile_summary.dart';
import 'package:task_manager/ui/ui_screen/add_new_task.dart';

import '../ui.widgets/summary_card.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewTask()));

        },child:const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ProfileSummary(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                const  SummaryCard(
                     count: '09',
                    title: 'Canceled',
                  ),
                  const SummaryCard(
                    count: '09',
                    title: 'Completed',
                  ),
                  const  SummaryCard(
                    count: '09',
                    title: 'Progress',
                  ),
                  const  SummaryCard(
                    count: '09',
                    title: 'New Task',
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ItemCard();
                },),
            )
          ],
        ),
      ),
    );
  }

}

