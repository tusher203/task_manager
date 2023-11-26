import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/ui_screen/update_profile.dart';

class ProfileSummary extends StatelessWidget {
  const ProfileSummary({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfie()));},
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Text('Rabbil Hasan',style: TextStyle(color: Colors.white),),
      subtitle: Text('rabbil@gmail.com',style: TextStyle(color: Colors.white)),
      trailing: Icon(Icons.arrow_circle_right_outlined),
      tileColor: Colors.green,
    );
  }
}