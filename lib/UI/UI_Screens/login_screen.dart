import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager_new/UI/UI_Screens/signup_screen.dart';
import 'package:task_manager_new/UI/UI_Widgets/background_scr.dart';
import 'package:task_manager_new/UI/auth/auth_model.dart';
import 'package:task_manager_new/data/models/user_model.dart';

import 'package:task_manager_new/utility/urls.dart';

import '../../data/network_caller.dart';
import '../../data/network_response.dart';
import '../UI_Widgets/snackbar_message.dart';
import 'forgot_password_screen.dart';
import 'main_bottom_nav_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEcontroller = TextEditingController();
  final TextEditingController _passwTEcontroller = TextEditingController();
  bool _loginProgress = false;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      Text(
                        'Get started with',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _emailTEcontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(hintText: 'Email Address'),
                        validator: (String? value) {
                          if (value!.isEmpty ?? true) {
                            return "Enter valid Email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _passwTEcontroller,
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'Password'),
                        validator: (String? value) {
                          if (value!.isEmpty ?? true) {
                            return 'Enter Valid Password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: _loginProgress == false,
                          replacement: Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              login();
                            },
                            child: Icon(
                              Icons.arrow_circle_left_outlined,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPassScreen()));
                            },
                            child: Text('Forgotten Password?'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't Have an Account?",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignUpScreen()));
                                },
                                child: Text('Sign Up'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    if (_formkey.currentState!.validate()) {
      // return;

      _loginProgress = true;
      if (mounted) {
        setState(() {});
      }
      NetworkResponse response = await NetworkCaller().postRequest(Urls.login,
          body: {
            "email": _emailTEcontroller.text.trim(),
            "password": _passwTEcontroller.text,
          },
          isLogin: true,);
      _loginProgress = false;
      if (mounted) {
        setState(() {});
      }
      if (response.isSuccess) {
        Authcontroller.saveModel(response.jsonResponse?['token'],
            userModel.fromJson(response.jsonResponse?['data']));

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainBottomNavScreen(),
          ),
        );
      } else {
        if (response.statusCode == 401) {
          if (mounted) {
            SnackMessage(context, "PLease Check Email or Password");
          }
        } else {
          if (mounted) {
            SnackMessage(context, "Login Failed!Please Try again");
          }
        }
      }
    }
  }

  @override
  void dispose() {
    _emailTEcontroller.dispose();
    _passwTEcontroller.dispose();
    super.dispose();
  }
}
