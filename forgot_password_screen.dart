import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/ui_screen/Signup_Screen.dart';
import 'package:task_manager/ui/ui_screen/login_screen.dart';
import 'package:task_manager/ui/ui_screen/pin_verification_screen.dart';

import '../ui.widgets/background.dart';

class ForgotPasScreen extends StatefulWidget {
  const ForgotPasScreen({super.key});

  @override
  State<ForgotPasScreen> createState() => _ForgotPasScreenState();
}

class _ForgotPasScreenState extends State<ForgotPasScreen> {
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
                'Your Email Address',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: 280,
                child: Wrap(
                  direction: Axis.horizontal,
                    verticalDirection: VerticalDirection.up,
                    children:[
                      Text(
                          "A 6 Digit verification pin will send to your email address",style:Theme.of(context).textTheme.bodySmall)
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: " Email"),
              ),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PinVerificationScreen()));
                    },
                    child: Icon(
                      Icons.arrow_circle_right_outlined,
                    )),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
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
