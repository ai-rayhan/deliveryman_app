import 'package:deliveryman_app/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:deliveryman_app/app.dart';
import 'package:deliveryman_app/common/controllers/theme_controller.dart';
import 'package:deliveryman_app/app/modules/language/controllers/language_controller.dart';
import 'package:deliveryman_app/common/models/language.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
   );


  ThemeController themeController = Get.put(ThemeController());
  await themeController.loadThemeStatus();
  await MyTranslations.loadTranslations();
  Get.put(LanguageController());
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => 
      const DeliveryManApp(),
    ),
  );
}
