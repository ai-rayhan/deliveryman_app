import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';

class MyTranslations extends Translations {
  static Map<String, String> enTranslations = {};
  static Map<String, String> bnTranslations = {};

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enTranslations,
        'bn_BD': bnTranslations,
      };

  static Future<void> loadTranslations() async {
    enTranslations = await _loadJson('assets/translations/en.json');
    bnTranslations = await _loadJson('assets/translations/bn.json');
  }

  static Future<Map<String, String>> _loadJson(String path) async {
    final jsonString = await rootBundle.loadString(path);
    return Map<String, String>.from(json.decode(jsonString));
  }
}
