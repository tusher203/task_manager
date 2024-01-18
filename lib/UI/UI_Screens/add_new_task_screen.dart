import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_new/UI/UI_Widgets/background_scr.dart';
import 'package:task_manager_new/UI/UI_Widgets/profile_summary_screen.dart';
import 'package:task_manager_new/UI/UI_Widgets/snackbar_message.dart';
import 'package:task_manager_new/data/network_caller.dart';
import 'package:task_manager_new/data/network_response.dart';

import '../../utility/urls.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _subTEcontroller = TextEditingController();
  final TextEditingController _descTEcontrller = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool createTaskinProgress =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            profile_summary(),
            SizedBox(
              height: 80,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BackgroundScreen(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Add New Task",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _subTEcontroller,
                            decoration: InputDecoration(
                              hintText: "Subject",
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty ?? true) {
                                return "Enter Subject Here";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _descTEcontrller,
                            maxLines: 5,
                            decoration: InputDecoration(hintText: 'Description'),
                            validator: (String? value) {
                              if (value!.isEmpty ?? true) {
                                return "Description must be 5 lines";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: Visibility(
                                visible:createTaskinProgress==false,
                                replacement: Center(
                                  child: CircularProgressIndicator(),
                                ),
                                child: ElevatedButton(
                                    onPressed:(){createTask();} ,
                                    child: Icon(Icons.arrow_forward_outlined)),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> createTask() async {
    if (_formkey.currentState!.validate()) {
      createTaskinProgress ==true;
      if (mounted) {
        setState(() {});
      }
      ;
      final NetworkResponse response =
          await NetworkCaller().postRequest(Urls.createTask,body: {
            "title":_subTEcontroller.text.trim(),
            "description":_descTEcontrller.text.trim(),
            "status":"New"
          });
      createTaskinProgress=false;
      if(mounted){
        setState(() {

        });

      }
      if(response.isSuccess){
        _subTEcontroller.clear();
        _descTEcontrller.clear();
        if(mounted){
          SnackMessage(context, "New Task Added");
        }
      }else{
        if(mounted){
          SnackMessage(context,"Create New Task File!Try Again",true);
        }

      }
    }
  }

  @override
  void dispose() {
    _subTEcontroller.dispose();
    _descTEcontrller.dispose();
  }
}
