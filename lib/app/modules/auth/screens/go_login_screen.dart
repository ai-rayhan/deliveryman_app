
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:deliveryman_app/common/global_widgets/appbar.dart';
import 'package:deliveryman_app/common/global_widgets/custom_asset_image.dart';
import 'package:deliveryman_app/helper/translated_text.dart';
import 'package:deliveryman_app/util/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class GotoLoginScreen extends StatelessWidget {
  const GotoLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(context: context, text: "please_login_to_continue".translate),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomAssetImageWidget(AssetPath.guest, width: 150, height: 150),
            const SizedBox(height: 16),
             Text(
              'you_are_guest'.translate,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'please_login_to_continue'.translate,
              style: TextStyle(fontSize: 14, color: Theme.of(context).hintColor),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.signIn);
              },
              child:  Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('login'.translate),
              ),
        
            ),
          ],
        ),
      ),
    
    );
  }
}
