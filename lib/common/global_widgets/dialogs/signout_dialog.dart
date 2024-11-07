
import 'package:deliveryman_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:deliveryman_app/common/global_widgets/dialogs/base_dialog.dart';
import 'package:deliveryman_app/helper/translated_text.dart';
import 'package:deliveryman_app/util/dimensions.dart';
import 'package:deliveryman_app/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSignOutDialog({
  required BuildContext context,
  required void Function(bool?)? onChanged,
  VoidCallback? onSubmitPressed,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomDialog(
        title: 'logout'.translate,
        content: Column(
          children: [
            Text("are_you_sure_you_want_to_logout".translate,
            style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GetBuilder<AuthController>(
                  builder: (controller) {
                    return Checkbox(
                      activeColor: Theme.of(context).primaryColor,
                      value:controller.isGlobalSignOut, onChanged: (val){
                      controller.globalSignOutChecked();
                    });
                  }
                ),
                Text(
                  "sign_out_from_all_devices".translate,
                  style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ],
        ),
        onSubmitPressed: (){
          if(Get.find<AuthController>().isGlobalSignOut){
            Get.find<AuthController>().signOutFromAllDevices();

          }else{
            Get.find<AuthController>().signOut();
            Get.toNamed(Routes.signIn);
          }
        },
      );
    },
  );
}