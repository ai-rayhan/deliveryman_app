
import 'package:deliveryman_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:deliveryman_app/common/global_widgets/custom_button.dart';
import 'package:deliveryman_app/common/global_widgets/custom_text_field.dart';
import 'package:deliveryman_app/helper/custom_validator.dart';
import 'package:deliveryman_app/util/asset_path.dart';
import 'package:deliveryman_app/util/show_snackbar.dart';
import 'package:deliveryman_app/util/sizedbox_space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deliveryman_app/util/dimensions.dart';
import 'package:deliveryman_app/util/styles.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _referCodeController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();


  String countryDialCode='';
  bool checked = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(AssetPath.logo, width: 200),
                  SizedBoxSpace.h20,
                  Row(
                    children: [
                      Text('sign_up'.tr,
                          style: robotoMedium.copyWith(
                              fontSize: Dimensions.fontSizeExtraLarge)),
                    ],
                  ),
                  const SizedBox(height: Dimensions.paddingSizeSmall),
                  Padding(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hintText: 'first_name'.tr,
                                controller: _firstNameController,
                                inputType: TextInputType.name,
                                capitalization: TextCapitalization.words,
                                prefixIcon: const Icon(Icons.person),
                                divider: false,
                                validator: CustomValidator.requiredField,
                              ),
                            ),
                            SizedBoxSpace.w10,
                            Expanded(
                              child: CustomTextField(
                                hintText: 'last_name'.tr,
                                controller: _lastNameController,
                                inputType: TextInputType.name,
                                capitalization: TextCapitalization.words,
                                prefixIcon: const Icon(Icons.person),
                                divider: false,
                                // validator: CustomValidator.requiredField,
                              ),
                            ),
                          ],
                        ),
                        SizedBoxSpace.h10,
                        CustomTextField(
                          hintText: "${'email'.tr} ${"optional".tr}",
                          controller: _emailController,
                          inputType: TextInputType.emailAddress,
                          prefixIcon: const Icon(Icons.email),
                          divider: false,
                          // validator: CustomValidator.requiredField,
                        ),
                        SizedBoxSpace.h10,
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                prefixIcon: const Icon(Icons.phone),
                                // prefixIcon: CodePickerWidget(
                                //   onChanged: (CountryCode countryCode) {
                                //     countryDialCode = countryCode.dialCode!;
                                //     log(countryDialCode.toString());
                                //   },
                                //   initialSelection: "BD",
                                // ),
                                hintText: 'phone'.tr,
                                controller: _phoneController,
                                inputType: TextInputType.phone,
                                divider: false,
                                validator: CustomValidator.validatePhone,
                              ),
                            ),
                          ],
                        ),
                        SizedBoxSpace.h10,
                        CustomTextField(
                          hintText: 'password'.tr,
                          controller: _passwordController,
                          inputType: TextInputType.visiblePassword,
                          prefixIcon: const Icon(Icons.lock),
                          isPassword: true,
                          divider: false,
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
                          validator: (value) => CustomValidator.confirmPassword(value, _passwordController.text),
                        ),
                        // SizedBoxSpace.h10,
                        // CustomTextField(
                        //   nextFocus: null,
                        //   hintText: 'refer_code'.tr,
                        //   controller: _referCodeController,
                        //   inputAction: TextInputAction.done,
                        //   inputType: TextInputType.text,
                        //   prefixIcon: const Icon(Icons.group),
                        //   isPassword: false,
                        // ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: Theme.of(context).primaryColor,
                        value: checked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            checked = newValue!;
                          });
                        },
                      ),
                      Text("i_agree_with_the".tr, style: robotoRegular),
                      SizedBoxSpace.w5,
                      GestureDetector(
                        onTap: () {
                        Get.toNamed(Routes.webview,arguments: "terms_and_conditions");
                      },
                        child: Text(
                          "tearms_&_conditions".tr,
                          style: robotoMedium.copyWith(color: Theme.of(context).primaryColor),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: Dimensions.paddingSizeSmall),
                  GetBuilder<AuthController>(
                    builder: (controller) {
                      if (controller.inProgress) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return CustomButton(
                        buttonText: 'sign_up'.tr,
                        onPressed: () async{
                          if (_formKey.currentState!.validate() && checked) {
                          final bool response= await controller.signupWithPhoneAndPassword(firstName: _firstNameController.text, lastName: _lastNameController.text, mobile: '$countryDialCode${_phoneController.text}', confirmPassword: _confirmPasswordController.text, email: _emailController.text, password: _passwordController.text);
                           if(response){
                             Get.toNamed(Routes.verifyOtp,arguments: {"phone": '$countryDialCode${_phoneController.text}'});
                           }else{
                            SnackbarHelper.showErrorSnackbar("Error!", controller.errorMessage);
                           }
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const SelectInterestScreen(),
                            //   ),
                            // );
                          }
                        }
                      );
                    }
                  ),
                  const SizedBox(height: Dimensions.paddingSizeLarge),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "already_have_an_account".tr,
                        style: robotoRegular.copyWith(color: Colors.grey[700]),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "sign_in".tr,
                          style: robotoMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimensions.paddingSizeExtraLarge)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
