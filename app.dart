import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/ui_screen/spalshScreen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        home: SplashScreen(),
        theme: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none)),
            textTheme: TextTheme(
                titleLarge:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                titleMedium: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45),
                bodySmall: TextStyle(fontSize: 16, color: Colors.grey)),
            //primaryColor: Colors.green,
            primarySwatch: Colors.green,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 18),
              ),
            ),
            textButtonTheme:
                TextButtonThemeData(style: TextButton.styleFrom())));
  }
}
