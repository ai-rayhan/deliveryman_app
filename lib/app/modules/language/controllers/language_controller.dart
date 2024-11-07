import 'dart:developer';
import 'package:deliveryman_app/common/models/language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {

  final _locale = Rx<Locale>(const Locale('en', 'US'));

  Locale get locale => _locale.value;
  String? lCode;
  void changeLocale(Locale value) {
    _locale.value = value;
    Get.updateLocale(value);
  }

  @override
  void onInit() {
    super.onInit();
    _loadLocaleFromPrefs();
    hasLocaleeInPrefs();
  }

  Future<void> _loadLocaleFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final String? languageCode = prefs.getString('language_code');
    final String? countryCode = prefs.getString('country_code');
    _locale.value = Locale(languageCode??'en', countryCode??'US');
    await MyTranslations.loadTranslations();
  }

  Future<void> saveLocaleToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', locale.languageCode);
    await prefs.setString('country_code', locale.countryCode ?? 'US');
  }
  hasLocaleeInPrefs()async{
    final prefs = await SharedPreferences.getInstance();
    lCode = prefs.getString('language_code');
    log("hasLocaleeInPrefs $lCode");
    update();
  }

}
