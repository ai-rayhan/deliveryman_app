import 'package:flutter/material.dart';

AppBar showAppBar(
    {required BuildContext context,
    required String text}) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
    
      ),
    ),
    title: Text(
      text,
      style: TextStyle(),
    ),
  );
}
