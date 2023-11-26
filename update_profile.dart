import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/ui.widgets/profile_summary.dart';

import '../ui.widgets/background.dart';

class UpdateProfie extends StatefulWidget {
  const UpdateProfie({super.key});

  @override
  State<UpdateProfie> createState() => _UpdateProfieState();
}

class _UpdateProfieState extends State<UpdateProfie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ProfileSummary(),
              Expanded(
                child: backgroundclr_screen(
                  Logo: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Text(
                          'Update Profile',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 50,
                          child: PhotoPicker(),
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
                        TextFormField(
                          decoration: InputDecoration(hintText: "First name"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(hintText: "Last Name"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(hintText: "Mobile"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: " Password",
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {},
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
            ],
          ),
        ),
      ),
    );
  }

  Container PhotoPicker() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                color: Colors.grey,
              ),
              child: Text(
                'Photos',
                style: TextStyle(color: Colors.white),
              ),
              alignment: Alignment.center,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(),
            ),
          ),
        ],
      ),
    );
  }
}
