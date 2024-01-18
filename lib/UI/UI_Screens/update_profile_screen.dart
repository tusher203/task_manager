import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager_new/UI/UI_Widgets/background_scr.dart';
import 'package:task_manager_new/UI/UI_Widgets/profile_summary_screen.dart';
import 'package:task_manager_new/UI/UI_Widgets/snackbar_message.dart';
import 'package:task_manager_new/UI/auth/auth_model.dart';
import 'package:task_manager_new/data/models/user_model.dart';
import 'package:task_manager_new/data/network_caller.dart';
import 'package:task_manager_new/data/network_response.dart';

import '../../utility/urls.dart';
import '../UI_Widgets/photo_picker_field.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fnNameController = TextEditingController();
  final TextEditingController _lnNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _PassController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    _emailController.text = Authcontroller.user?.email ?? "";
    _fnNameController.text = Authcontroller.user?.firstName ?? "";
    _lnNameController.text = Authcontroller.user?.lastName ?? "";
    _mobileController.text = Authcontroller.user?.mobile ?? "";
    _PassController.text = Authcontroller.user?.password ?? "";
  }

  bool UpdateProfileProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const profile_summary(enableonTap: false),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: BackgroundScreen(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 80,
                            ),
                            Text(
                              'Update Profile',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleLarge,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(child: photopickerfield()),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                              ),
                              validator: (String? value) {
                                if (value!.isEmpty ?? true) {
                                  return "Please Enter Valid Email";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _fnNameController,
                              decoration:
                              const InputDecoration(hintText: 'First Name'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _lnNameController,
                              decoration:
                              const InputDecoration(hintText: "Last Name"),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _mobileController,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                hintText: "Mobile",
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _PassController,
                              // obscureText: true,
                              decoration:
                              InputDecoration(hintText: "Password(optional)"),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Visibility(
                                visible: UpdateProfileProgress == false,
                                replacement: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (_formkey.currentState!.validate()) {
                                        if (mounted) {
                                          setState(() {});
                                        }
                                        UpdateProfile();
                                      }
                                    },
                                    child: Icon(Icons.arrow_forward_outlined)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> UpdateProfile() async {
    UpdateProfileProgress = true;
    if (mounted) {
      setState(() {});
    }

    Map<String, dynamic> InputData = {
      "email": _emailController.text.trim(),
      "firstName": _fnNameController.text.trim(),
      "lastName": _lnNameController.text.trim(),
      "mobile": _mobileController.text.trim(),
      "photo": "",
    };
    if (_PassController.text.isEmpty) {
      InputData['password'] = _PassController.text;
    }


    final NetworkResponse response = await NetworkCaller().postRequest(
      Urls.UpdateProfile, body: InputData,

      // "email": _emailController,
      // "firstName": _fnNameController.text.trim(),
      // "lastName": _lnNameController.text.trim(),
      // "mobile": _mobileController.text.trim(),
    );

    UpdateProfileProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      Authcontroller.UpdateProfileModel(
          userModel(email: _emailController.text.trim(),
            firstName: _fnNameController.text.trim(),
            lastName: _lnNameController.text.trim(),
            mobile: _mobileController.text.trim(),)

      );
      if (mounted) {
        SnackMessage(context, "Update Profile Successfully");
      }
    } else {
      {
        if (mounted) {
          SnackMessage(context, "Update Profile Failed!Please Try Again", true);
        }
      }
      ;
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _fnNameController.dispose();
    _lnNameController.dispose();
    _mobileController.dispose();
    _PassController.dispose();
  }

}



