import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class photopickerfield extends StatefulWidget {
  const photopickerfield({
    super.key,
  });

  @override
  State<photopickerfield> createState() => _photopickerfieldState();
}

class _photopickerfieldState extends State<photopickerfield> {

  XFile? photo;
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      width: 500,
      color: Colors.white,
      child: Row(children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),),

            child: const Text(

              'Photos',
              style: TextStyle(color: Colors.white),
            ),
            alignment: Alignment.center,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 7,
          child: InkWell(
            onTap: () async {
              final XFile? image =
                  await ImagePicker().pickImage(source: ImageSource.camera);
              if (image!=  null) {
                 photo = image;
                if(mounted){
                  setState(() {

                  });
                  String? photoInBase64;
                  Map<String, dynamic> InputData = {

                   "photo":photoInBase64,
                  };
                  if(photo!=null){
                    List<int>imageBytes=await photo!.readAsBytes();
                    String photoInBase64=base64Encode(imageBytes);
                    InputData['photo']=photoInBase64;
                  }
                }
              }
            },
            child: Container(


              child: Visibility(

                  visible: photo == null,
                  replacement: Text(photo?.path ?? ""),
                  child:const Text("Select Photo"),),
            ),
          ),
        ),
      ]),
    );
  }
}

