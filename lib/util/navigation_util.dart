import 'package:flutter/material.dart';

class Navigate {
  static void to({required Widget screen, required BuildContext context}) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  static void off({required Widget screen, required BuildContext context}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  static void offAll({required Widget screen, required BuildContext context}) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screen),
      (route) => false,
    );
  }
}
