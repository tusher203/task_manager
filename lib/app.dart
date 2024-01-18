import 'package:flutter/material.dart';
import 'package:task_manager_new/UI/UI_Screens/splash_screen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});
  ///network caller er context k remove korar jonno globalkey make krte hbe.
static GlobalKey<NavigatorState> NavigatorKey=GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey:NavigatorKey ,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
              color: Colors.black87, fontSize: 30, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(
              fontSize: 16, color: Colors.black87, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(
            color: Colors.black87,
            //  fontSize: 20,
            //fontWeight: FontWeight.bold,
          ),
        ),
        primarySwatch: Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          textStyle: TextStyle(color: Colors.green),
          padding: EdgeInsets.all(20),
        )),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            textStyle: TextStyle(
                color: Colors.green, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),

      ),
      home: SplashScreen(),
    );
  }
}
