import 'package:deliveryman_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:deliveryman_app/app/modules/language/controllers/language_controller.dart';
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:deliveryman_app/common/global_widgets/custom_asset_image.dart';
import 'package:deliveryman_app/util/asset_path.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
   WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    await Future.delayed(const Duration(seconds: 1));
    await Get.find<AuthController>().getUserDetails();
    await Get.find<LanguageController>().hasLocaleeInPrefs();
   if(Get.find<LanguageController>().lCode!=null && AuthController.userAddress!=null){
    Get.offAndToNamed(Routes.bottomNavigationBar);
   } else if(Get.find<LanguageController>().lCode!=null){
    Get.offNamed(Routes.location);
   }
  //  else if(Get.find<LanguageController>().lCode!=null){
  //   Get.offNamed(Routes.onboard);
  //  }
   else{
    Get.offNamed(Routes.language);
   }
   });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Center(child: CustomAssetImageWidget(AssetPath.logo,fit: BoxFit.contain,width: 200,)),
        ],
      )
      
    );
  }
}