import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager/ui/ui_screen/Signup_Screen.dart';
import 'package:task_manager/ui/ui_screen/set_password_screen1.dart';

import '../ui.widgets/background.dart';
import 'login_screen.dart';

///Pin Verification er field gula design korar jonno Package use korte hbe name holo (pin_code_fields 8.0.1 ).PincodeTextField er code package theke copy korte ante hbe

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: backgroundclr_screen(
      Logo: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              Text(
                'Pin Verification',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: Wrap(
                    direction: Axis.horizontal,
                    verticalDirection: VerticalDirection.up,
                    children: [
                      Text(
                          "A 6 Digit verification pin will send to your email address",
                          style: Theme.of(context).textTheme.bodySmall)
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              PinCodeTextField(
                length: 6,
                obscureText: false,
                //animationType: AnimationType.fade,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    activeColor: Colors.green,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                inactiveColor: Colors.white,
                ),
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  return true;
                },
                appContext: context,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>SetPasswordScreen1()));}, child: Text('Verify')),
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have an Account?",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);;
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 16),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
