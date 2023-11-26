import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/ui_screen/canceled_screen.dart';
import 'package:task_manager/ui/ui_screen/completed_screen.dart';
import 'package:task_manager/ui/ui_screen/progress_screen.dart';
import 'package:task_manager/ui/ui_screen/task_screen.dart';

class BottonNavigationScreen extends StatefulWidget {
  const BottonNavigationScreen({super.key});

  @override
  State<BottonNavigationScreen> createState() => _BottonNavigationScreenState();
}

class _BottonNavigationScreenState extends State<BottonNavigationScreen> {
  int _Selecteditem = 0;
  List<Widget>screen=[
    TaskScreen(),
    ProgressScreen(),
    CompletedScreen(),
    CancelledScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:screen[_Selecteditem],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _Selecteditem,
        onTap: (index) {
          _Selecteditem = index;
          setState(() {});
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'New Task'),
          BottomNavigationBarItem(icon: Icon(Icons.change_circle_outlined), label: 'Progress'),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Completed'),
          BottomNavigationBarItem(icon: Icon(Icons.close), label: 'Canceled'),
        ],
      ),
    );
  }
}
