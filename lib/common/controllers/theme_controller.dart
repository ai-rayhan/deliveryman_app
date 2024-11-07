import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  var isDarkMode = false;
  Color decorationColor = Colors.white;
  
  void toggleTheme() {
    isDarkMode = !isDarkMode;
    update();
    Get.changeThemeMode(isDarkMode? ThemeMode.dark : ThemeMode.light);
    saveThemeStatus(isDarkMode);
  }

  Future<void> saveThemeStatus(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDark);
  }

  Future<void> loadThemeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkMode= prefs.getBool('isDarkMode') ?? false;
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }
  updateDecorationColor(){
    if(isDarkMode){
      decorationColor=Colors.black54;
    }else{
       decorationColor=Colors.white;
    }
    update();
  }
}
