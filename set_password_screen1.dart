import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/ui_screen/Signup_Screen.dart';
import 'package:task_manager/ui/ui_screen/login_screen.dart';
import 'package:task_manager/ui/ui_screen/pin_verification_screen.dart';

import '../ui.widgets/background.dart';

class SetPasswordScreen1 extends StatefulWidget {
  const SetPasswordScreen1({super.key});

  @override
  State<SetPasswordScreen1> createState() => _SetPasswordScreen1State();
}

class _SetPasswordScreen1State extends State<SetPasswordScreen1> {
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
                    'Set Password',
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
                              "Minimum length password 8 character with Latter and number combination",style:Theme.of(context).textTheme.bodySmall)
                        ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: " Password"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: " Confirm Password"),
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
                        child: Text("Confirm")),
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
                           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
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
