import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/ui.widgets/background.dart';
import 'package:task_manager/ui/ui_screen/login_screen.dart';

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
    await Future.delayed(Duration(seconds: 1)).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: backgroundclr_screen(
      Logo: Center(
        child: SvgPicture.asset(
          'assets/images/app_logo.svg',
          width: 120,
        ),
      ),
    ));
  }
}
