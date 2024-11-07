import 'package:flutter/material.dart';

class DialogHelper {
  static void generalDialog(BuildContext context, {required String message,bool isSuccess=true,}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pop();
        });

        return Dialog(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                isSuccess? const Icon(Icons.check_circle_rounded, color: Colors.green):
                const Icon(Icons.error, color: Colors.red),
                const SizedBox(width: 10),
                Text(message),
              ],
            ),
          ),
        );
      },
    );
  }
}
