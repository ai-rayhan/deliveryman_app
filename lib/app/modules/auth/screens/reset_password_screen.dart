import 'package:deliveryman_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:deliveryman_app/common/global_widgets/appbar.dart';
import 'package:deliveryman_app/common/global_widgets/custom_button.dart';
import 'package:deliveryman_app/common/global_widgets/custom_text_field.dart';
import 'package:deliveryman_app/util/asset_path.dart';
import 'package:deliveryman_app/util/dimensions.dart';
import 'package:deliveryman_app/util/show_snackbar.dart';
import 'package:deliveryman_app/util/sizedbox_space.dart';
import 'package:deliveryman_app/helper/custom_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final args=Get.arguments;
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(context: context, text: "reset_password".tr),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBoxSpace.h30,
              Center(
                child: SizedBox(
                  height: 100,
                  child: Image.asset(AssetPath.forgetIcon),
                ),
              ),
              Text(
                "enter_new_and_reset_password".tr,
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBoxSpace.h30,
              CustomTextField(
                hintText: 'new_password'.tr,
                controller: _newPasswordController,
                inputAction: TextInputAction.done,
                inputType: TextInputType.visiblePassword,
                prefixIcon: const Icon(Icons.lock),
                isPassword: true,
                validator: CustomValidator.validatePassword,
              ),
              SizedBoxSpace.h10,
              CustomTextField(
                hintText: 'confirm_password'.tr,
                controller: _confirmPasswordController,
                inputAction: TextInputAction.done,
                inputType: TextInputType.visiblePassword,
                prefixIcon: const Icon(Icons.lock),
                isPassword: true,
                nextFocus: null,
                validator: (value) => CustomValidator.confirmPassword(value, _newPasswordController.text),
              ),
              SizedBoxSpace.h20,
              GetBuilder<AuthController>(
                builder: (controller) {
                  return CustomButton(
                    buttonText: "submit".tr,
                    onPressed: () async{
                      if (_formKey.currentState!.validate()) {
                        bool response=await controller.resetPassword(
                           args['phone'],
                           args['otp'],
                          _newPasswordController.text,
                      
                        );
                        if(response){
                          Get.offAllNamed(Routes.signIn);
                        }else{
                          SnackbarHelper.showErrorSnackbar("Error", controller.errorMessage);
                        }
                      }
                    },
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
