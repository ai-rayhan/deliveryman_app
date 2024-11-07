import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHelper {
 static showErrorSnackbar(String title, String message) {
    Get.closeAllSnackbars();
    Get.snackbar(title, message,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.only(top: 10,right: 30,left: 30));

  }
 static showSuccessSnackbar(String title, String message) {
    Get.closeAllSnackbars();
    Get.snackbar(title,message ,
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.only(top: 10,right: 30,left: 30));

  }
 static generalSnackbar( String title, {String? message}) {
    Get.closeAllSnackbars();
    Get.snackbar(title,message?? "" ,
        backgroundColor: Get.theme.cardColor.withOpacity(.6),
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.only(top: 10,right: 30,left: 30));

  }
  
static showCustomSnackbar({
  required BuildContext context,
  required String message,
  double width = 70,
  double height = 30,
  Color backgroundColor =const Color.fromARGB(255, 64, 53, 100),
  double borderRadius = 12,
}) {
  final snackbar = SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20), // Add margin to position it nicely
    padding: const EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius), // Set the border radius
    ),
    content: Container(
      width: width, // Set desired width here
      height: height, // Set desired height here
      child: Center(
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    ),
    backgroundColor: backgroundColor, // Set background color
  );

 ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackbar);
}

}
