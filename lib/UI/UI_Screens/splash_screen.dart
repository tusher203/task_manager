import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_new/UI/UI_Screens/login_screen.dart';
import 'package:task_manager_new/UI/UI_Screens/main_bottom_nav_screen.dart';
import 'package:task_manager_new/UI/UI_Widgets/background_scr.dart';
import 'package:task_manager_new/UI/auth/auth_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    gotoLogin();
  }

  void gotoLogin() async {
    final bool isLoogined=await Authcontroller.checkAuthState();
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) =>isLoogined?const MainBottomNavScreen():const LoginScreen(),),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        BackgroundScreen(
          child: Center(
            child: SvgPicture.asset('assets/images/logo.svg'),
          ),
        ),
      ],
    ));
  }
}
