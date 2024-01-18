import 'package:flutter/material.dart';

void SnackMessage(BuildContext context, message,[isError = false]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: isError ? Colors.red : null,
    ),
  );
}
