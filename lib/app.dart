import 'package:deliveryman_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:deliveryman_app/app/modules/currency/controllers/currency_controller.dart';
import 'package:deliveryman_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:deliveryman_app/app/routes/app_pages.dart';
import 'package:deliveryman_app/app/modules/language/controllers/language_controller.dart';
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:deliveryman_app/common/models/language.dart';
import 'package:deliveryman_app/theme/dark_theme.dart';
import 'package:deliveryman_app/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deliveryman_app/app/modules/location/controllers/location_controller.dart';

class DeliveryManApp extends StatelessWidget {
  const DeliveryManApp({super.key});

  @override
  Widget build(BuildContext context) {
          return GetMaterialApp(
            defaultTransition: Transition.fadeIn,
            transitionDuration: const Duration(seconds: 1),
            debugShowCheckedModeBanner: false,
            theme: light(),
            darkTheme: dark(),
            themeMode: ThemeMode.system,
            translations: MyTranslations(),
            locale: Get.find<LanguageController>().locale,
            fallbackLocale: const Locale('en', 'US'),
            initialRoute: Routes.splash,
            getPages: AppPages.routes,
            initialBinding: InitialBindings(),
          );
  }
}


class InitialBindings extends Bindings {
  @override
  void dependencies() {
 Get.put(AuthController());
 Get.put(LanguageController());
 Get.put(ProfileController());
 Get.put(LocationController());
 Get.put(CurrencyController());


  }
}
