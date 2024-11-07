import 'package:deliveryman_app/app/modules/language/models/language_model.dart';
import 'package:deliveryman_app/util/asset_path.dart';

class AppConstants {
  static const String appName = '6amMart';
  static const double appVersion = 2.9;

 static const String fontFamily = 'Roboto';
 static const String networkPlaceHolder='https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png';

  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: AssetPath.english, languageName: 'English', countryCode: 'US', languageCode: 'en'),
    // LanguageModel(imageUrl: AssetPath.arabic, languageName: 'عربى', countryCode: 'SA', languageCode: 'ar'),
    // LanguageModel(imageUrl: AssetPath.spanish, languageName: 'Spanish', countryCode: 'ES', languageCode: 'es'),
    LanguageModel(imageUrl: AssetPath.bengali, languageName: 'Bengali', countryCode: 'BN', languageCode: 'bn'),
  ];

}
