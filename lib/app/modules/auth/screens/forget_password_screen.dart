import 'package:deliveryman_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:deliveryman_app/common/global_widgets/appbar.dart';
import 'package:deliveryman_app/common/global_widgets/custom_button.dart';
import 'package:deliveryman_app/common/global_widgets/custom_text_field.dart';
import 'package:deliveryman_app/helper/custom_validator.dart';
import 'package:deliveryman_app/util/asset_path.dart';
import 'package:deliveryman_app/util/dimensions.dart';
import 'package:deliveryman_app/util/sizedbox_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  String countryDialCode = '';
  final TextEditingController _phoneNoController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(context: context, text: "forgot_password".tr),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Image.asset(AssetPath.forgot),
              ),
              SizedBoxSpace.h20,
              Text(
                "forget_password_description".tr,
                textAlign: TextAlign.center,
              ),
              SizedBoxSpace.h30,
              CustomTextField(
                prefixIcon: Icon(Icons.phone),
                // prefixIcon: CodePickerWidget(
                //   onChanged: (CountryCode countryCode) {
                //     countryDialCode = countryCode.dialCode!;
                //   },
                //   initialSelection: "BD",
                // ),
                hintText: "enter_phone_number".tr,
                controller: _phoneNoController,
                focusNode: _phoneFocusNode,
                nextFocus: null,
                inputType: TextInputType.phone,
                divider: false,
                validator: CustomValidator.validatePhone,
              ),
              SizedBoxSpace.h10,
              GetBuilder<AuthController>(
                builder: (controller) {
                  if (controller.inProgress) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return CustomButton(
                    buttonText: 'next'.tr,
                    onPressed: () async{
                      if (_formKey.currentState!.validate()) {
                       bool result =await controller.sendOtp(countryDialCode + _phoneNoController.text);
                       if(result){
                         Get.toNamed(Routes.verifyOtp, arguments: {
                           'phone': countryDialCode + _phoneNoController.text,
                           'isForgetPassword': true
                           }); 
                       }
                      }
                    }
                  );
                }
              ),
              SizedBoxSpace.h20,
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    "contact_support".tr,
                    style: TextStyle(color: Colors.grey[700], fontSize: Dimensions.fontSizeSmall),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.helpAndSupport);
                    },
                    child: Text(
                      "help_support".tr,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: Dimensions.fontSizeSmall,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  )
                ],
              ),
              SizedBoxSpace.h30
            ],
          ),
        ),
      ),
    );
  }
}
