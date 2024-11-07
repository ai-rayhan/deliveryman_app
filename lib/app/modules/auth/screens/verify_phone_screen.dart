import 'package:deliveryman_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:deliveryman_app/common/global_widgets/appbar.dart';
import 'package:deliveryman_app/common/global_widgets/custom_button.dart';
import 'package:deliveryman_app/common/global_widgets/custom_text_field.dart';
import 'package:deliveryman_app/helper/custom_validator.dart';
import 'package:deliveryman_app/util/dimensions.dart';
import 'package:deliveryman_app/util/sizedbox_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyPhoneScreen extends StatefulWidget {
  const VerifyPhoneScreen({super.key});

  @override
  State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
  String countryDialCode = '';
  final TextEditingController _phoneNoController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final bool isFromCheckout = Get.arguments?["isFromCheckout"] ?? false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar(context: context, text: "enter_phone_number".tr),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor.withOpacity(.2),
                radius: 50,
                child: Icon(Icons.phone_android_outlined,color: Theme.of(context).primaryColor,size:50,),
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
                       bool result =await controller.signupWithPhone(mobile:  _phoneNoController.text);
                       if(result){
                         Get.toNamed(Routes.verifyOtp, arguments: {
                           'phone': countryDialCode + _phoneNoController.text,
                           'signupWithPhone': true,
                           'isFromCheckout':isFromCheckout
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
