import 'dart:js';

import 'package:flutter/material.dart';

void ShowSnackMessage(BuildContext context,String message,[isError=false] ){

  ScaffoldMessenger.of( context).showSnackBar(
    SnackBar(
      content: Text(
         message),
      backgroundColor:isError?Colors.red:null,
    ),
  );
}