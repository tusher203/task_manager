import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data.network_caller/network_caller.dart';

import '../../data.network_caller/networkResponse.dart';
import '../../data/utility/urls.dart';
import '../ui.widgets/background.dart';
import '../ui.widgets/snack_message.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEcontroller = TextEditingController();
  final TextEditingController _firstNameTEcontroller = TextEditingController();
  final TextEditingController _lastNameTEcontroller = TextEditingController();
  final TextEditingController _mobileTEcontroller = TextEditingController();
  final TextEditingController _passwordTEcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _signUpinProgress=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: backgroundclr_screen(
      Logo: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                ),
                Text(
                  'Join With Us',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: _emailTEcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: " Email"),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter Your Valid Email';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _firstNameTEcontroller,
                  decoration: InputDecoration(hintText: "First name"),
                  validator: (String? value) {
                    if (value?.trim().isNotEmpty ?? true) {
                      return 'Enter valid First name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _lastNameTEcontroller,
                  decoration: InputDecoration(hintText: "Last Name"),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter valid Last name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _mobileTEcontroller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(hintText: "Mobile"),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter valid Mobile number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordTEcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: " Password",
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter valid Password';
                    }
                    if (value!.length < 8) {
                      return "enter password more than 8 character";
                    }

                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Visibility(
                    visible: _signUpinProgress==false,
                    replacement: Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _signUpinProgress=true;
                          final NetworkResponse response = await NetworkCaller(

                          )

                              .postRequest(Urls.Registartion,body: {
                            "email":_emailTEcontroller.text.trim(),

                            "firstName":_firstNameTEcontroller.text.trim(),
                            "lastName":_lastNameTEcontroller.text.trim(),
                            "mobile":_mobileTEcontroller.text.trim(),
                            "password":_passwordTEcontroller.text,

                          });
                          _signUpinProgress=false;
                          if (response.isSuccess) {
                            if (mounted) {
                              ShowSnackMessage(context,
                                  'Account has been created!Please Login');
                            }
                          }
                        } else {
                          if (mounted) {
                            ShowSnackMessage(context,
                                'Account Creation failes!Please try again', true);
                          };

                      };
                      },
                      child: Icon(
                        Icons.arrow_circle_right_outlined,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have Account?",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
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
      ),
    ));
  }

  @override
  void dispose() {
    _emailTEcontroller.dispose();
    _firstNameTEcontroller.dispose();
    _lastNameTEcontroller.dispose();
    _mobileTEcontroller.dispose();
    _passwordTEcontroller.dispose();
  }
}

