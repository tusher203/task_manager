import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager_new/UI/UI_Screens/login_screen.dart';
import 'package:task_manager_new/UI/UI_Screens/update_profile_screen.dart';
import 'package:task_manager_new/UI/auth/auth_model.dart';

class profile_summary extends StatefulWidget {
  const profile_summary({
    super.key, this.enableonTap=true,
  });
final bool enableonTap;

  @override
  State<profile_summary> createState() => _profile_summaryState();
}

class _profile_summaryState extends State<profile_summary> {

  Widget _buildUserImage(String? imageBytes) {
    try {
      if (imageBytes != null) {
        Uint8List imageBytess = const Base64Decoder().convert(imageBytes.replaceAll('data:image/png;base64,',''));
        return Image.memory(
          imageBytess,
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        );
      }
    } catch (e) {
      log('Error loading user image: $e');
    }
    // Return a default image or placeholder if an error occurs
    return const CircleAvatar(
      child: Icon(Icons.error),
    );
  }

  @override
  Widget build(BuildContext context) {

    return ListTile(

      onTap:(){
        if(widget.enableonTap) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const UpdateProfileScreen(),),);
        }},
      leading: CircleAvatar(

      child:
       Authcontroller.user?.photo==null?
       Icon(Icons.person): ClipRRect(
           borderRadius: BorderRadius.circular(40),

           child:_buildUserImage(Authcontroller.user?.photo?? '')),
       ),
      title: Text(

        fullName,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700),
      ),
      subtitle: Text(
        Authcontroller.user?.email??'',
        style: TextStyle(color: Colors.white, fontSize: 13),
      ),
      trailing:IconButton(
        onPressed: ()async{
          if(mounted){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
          }
          await Authcontroller.ClearData();

        },icon: Icon(Icons.logout),
      ),
      tileColor: Colors.green,
    );
  }
String get fullName{
   return "${Authcontroller.user?.firstName??''} ${Authcontroller.user?.lastName??''}";

}
}

