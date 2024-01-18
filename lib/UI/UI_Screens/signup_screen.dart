import 'package:flutter/material.dart';
import 'package:task_manager_new/UI/UI_Screens/login_screen.dart';

import 'package:task_manager_new/UI/UI_Widgets/background_scr.dart';

import '../../data/network_caller.dart';
import '../../data/network_response.dart';
import '../../utility/urls.dart';
import '../UI_Widgets/snackbar_message.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //
  // @override
  // void initState(){
  //   super.initState();
  //   goSignup3();
  // }
  // void goSignup3(){
  //   Future.delayed(Duration(seconds: 2)).then((value) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>PasswordScreen()), (route) => false));
  // }

  final TextEditingController _emailTEcontroller = TextEditingController();
  final TextEditingController _fnTEcontroller = TextEditingController();
  final TextEditingController _lnTEcontroller = TextEditingController();
  final TextEditingController _mobileTEcontroller = TextEditingController();
  final TextEditingController _passTEcontroller = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _signupInprogress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    Text(
                      'Join With Us',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailTEcontroller,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Enter valid Email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _fnTEcontroller,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Enter valid First Name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _lnTEcontroller,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        filled: true,
                        fillColor: Colors.white,
                        // enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                        // focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Enter valid Last Name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _mobileTEcontroller,
                      decoration: InputDecoration(
                        hintText: 'Mobile',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "Enter valid Mobile Number";
                        }
                        if (value!.length > 11) {
                          return "Mobile Number must be 11 digit";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passTEcontroller,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      validator: (String? value) {
                        if (value?.isEmpty ?? true) {
                          return "Enter valid Password";
                        }
                        if (value!.length < 6) {
                          return 'Password must be 6 character or number';
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
                        visible: _signupInprogress == false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            signup();
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Have an Account?",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                  (route) => false);
                            },
                            child: const Text('Sign In'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signup() async {
    {
      if (_formkey.currentState!.validate()) {
        _signupInprogress = true;
        if (mounted) {
          setState(() {});
        }

        final NetworkResponse response =
            await NetworkCaller().postRequest(Urls.registration, body: {
          "email": _emailTEcontroller.text.trim(),
          "firstName": _fnTEcontroller.text.trim(),
          "lastName": _lnTEcontroller.text.trim(),
          "mobile": _mobileTEcontroller.text.trim(),
          "password": _passTEcontroller.text,
        });

        _signupInprogress = false;
        if (mounted) {
          setState(() {});
        }
        if (response.isSuccess) {
          if (mounted) {
            SnackMessage(context, 'Account has been Created!Please Login');
          }
        } else {
          if (mounted) {
            SnackMessage(
                context, 'Account creation failed!Please try again', true);
          }
        }
      }
    }
  }

  void clearTextFields() {
    _emailTEcontroller.clear();
    _fnTEcontroller.clear();
    _lnTEcontroller.clear();
    _mobileTEcontroller.clear();
    _passTEcontroller.clear();
  }

  @override
  void dispose() {
    _emailTEcontroller.dispose();
    _fnTEcontroller.dispose();
    _lnTEcontroller.dispose();
    _mobileTEcontroller.dispose();
    _passTEcontroller.dispose();
    super.dispose();
  }
}
