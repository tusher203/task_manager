import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_new/UI/UI_Screens/new_task_screen.dart';
import 'package:task_manager_new/UI/UI_Screens/progress_screen.dart';

import 'cancel_screen.dart';
import 'completed_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedItemsindex = 0;
  List<Widget> _Screen = [
    NewTaskScreen(),

    ProgressScreen(),
    CompletedScreen(),

    CancelScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Screen[_selectedItemsindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedItemsindex,
        onTap: (index) {
          _selectedItemsindex = index;
          setState(() {});
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black87,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'New Task'),
          BottomNavigationBarItem(
                                    icon: Icon(Icons.change_circle_outlined), label: 'Progress'),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Completed'),
          BottomNavigationBarItem(icon: Icon(Icons.close), label: 'Canceled'),
        ],
      ),
    );
  }
}



