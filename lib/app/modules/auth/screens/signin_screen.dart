import 'package:deliveryman_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:deliveryman_app/app/modules/auth/screens/signup_screen.dart';
import 'package:deliveryman_app/common/global_widgets/custom_text_field.dart';
import 'package:deliveryman_app/app/modules/auth/screens/forget_password_screen.dart';
import 'package:deliveryman_app/helper/custom_validator.dart';
import 'package:deliveryman_app/helper/translated_text.dart';
import 'package:deliveryman_app/util/asset_path.dart';
import 'package:deliveryman_app/util/show_snackbar.dart';
import 'package:deliveryman_app/util/sizedbox_space.dart';
import 'package:deliveryman_app/util/styles.dart';
import 'package:deliveryman_app/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool checked = false;
  String countryDialCode = '';

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    width: 170,
                    child: Image.asset(AssetPath.logo, fit: BoxFit.cover),
                  ),
                ),
                SizedBoxSpace.h16,
                Text(
                  "sign_in".translate,
                  style: robotoRegular.copyWith(fontWeight: FontWeight.bold, fontSize: Dimensions.fontSizeOverLarge),
                ),
                SizedBoxSpace.h30,
                Row(children: [
                  Expanded(
                      flex: 1,
                      child: CustomTextField(
                        prefixIcon: const Icon(Icons.phone),
                        // prefixIcon: CodePickerWidget(
                        //   onChanged: (CountryCode countryCode) {
                        //     countryDialCode = countryCode.dialCode!;
                        //   },
                        //   initialSelection: "BD",
                        // ),
                        hintText: "enter_phone_number".translate,
                        controller: _phoneController,
                        // inputType: TextInputType.phone,
                        divider: false,
                        validator: CustomValidator.validatePhone,
                      )),
                ]),
                SizedBoxSpace.h16,
                CustomTextField(
                  hintText:"password".translate,
                  controller: _passwordController,
                  inputAction: TextInputAction.done,
                  inputType: TextInputType.visiblePassword,
                  prefixIcon: const Icon(Icons.lock),
                  isPassword: true,
                  nextFocus: null,
                  validator: CustomValidator.validatePassword,
                ),
                SizedBoxSpace.h10,
                Row(
                  children: [
                    // Checkbox(
                    //   activeColor: Theme.of(context).primaryColor,
                    //   value: checked,
                    //   onChanged: (bool? newValue) {
                    //     setState(() {
                    //       checked = newValue!;
                    //     });
                    //   },
                    // ),
                    // Text(LanKeys.rememberMe.key.tr, style: robotoRegular),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgetPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                       "forget_password".translate,
                        style: robotoRegular.copyWith(color: Theme.of(context).primaryColor),
                      ),
                    )
                  ],
                ),
                SizedBoxSpace.h16,
                Row(
                  children: [
                    Text(
                      "by_signing_up_you_agree_to_our".translate,
                      style: robotoRegular.copyWith(color: Colors.grey[700], fontSize: Dimensions.fontSizeSmall),
                    ),
                    SizedBoxSpace.w5,
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.webview,arguments: "terms_and_conditions");
                      },
                      child: Text(
                       "terms_and_conditions".translate,
                        style: robotoRegular.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSizeSmall,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                SizedBoxSpace.h10,
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                          child: GetBuilder<AuthController>(
                            builder: (controller) {
                              if(controller.inProgress){
                                return const Center(child: CircularProgressIndicator());
                              }
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context).primaryColor),
                                onPressed: () async{
                                  if (_formKey.currentState!.validate()) {
                                   bool response =  await controller.signInWithPhoneAndPassword("${countryDialCode}${_phoneController.text}", _passwordController.text);
                                    if(response){
                                    Get.offAllNamed(Routes.bottomNavigationBar);
                                    }else{
                                      SnackbarHelper.showErrorSnackbar("Error!",controller.errorMessage);
                                      
                                    }
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                                  child: Text("sign_in".translate, style: robotoRegular),
                                ),
                              );
                            }
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBoxSpace.h16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("don_t_have_an_account".translate,
                      style: robotoRegular.copyWith(color: Colors.grey[700], fontSize: Dimensions.fontSizeSmall),
                    ),
                    GestureDetector(
                      onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => RegisterScreen(),
                        //   ),
                        // );
                      },
                      child: Text("sign_up".translate,
                        style: robotoRegular.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: Dimensions.fontSizeSmall,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
               SizedBoxSpace.h16,
                DividedSectionHeader(title:'social_login'.translate),
               SizedBoxSpace.h20,
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      // Get.find<AuthController>().signInWithGoogle();
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 20,
                      backgroundImage: AssetImage(AssetPath.google),
                    ),
                  ),
                  SizedBoxSpace.w16,
                  GestureDetector(
                    onTap: (){
                      // Get.find<AuthController>().signInWithFacebook();
                    },
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(AssetPath.facebook),
                    ),
                  )
                ],
               ),
               SizedBoxSpace.h20,
                DividedSectionHeader(title: "or".translate),
               SizedBoxSpace.h10,
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   OutlinedButton.icon(
                     style: OutlinedButton.styleFrom(
                       side: BorderSide(color: Theme.of(context).primaryColor.withOpacity(.5)),
                       shape: const StadiumBorder(),
                       padding: const EdgeInsets.symmetric(horizontal: 50),
                     ),
                    onPressed: (){
                    Get.toNamed(Routes.verifyPhone);
                   }, label: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                     child: Text("signin_with_phone_otp".translate,style: robotoRegular.copyWith(color: Theme.of(context).primaryColor),),
                   ), icon: Icon(Icons.phone,color: Theme.of(context).primaryColor,)),
                 ],
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DividedSectionHeader extends StatelessWidget {
  const DividedSectionHeader({
    super.key, required this.title,
  });
  final String  title;
  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
     Container(height: 1,width:100,color: Theme.of(context).highlightColor),
     SizedBoxSpace.w16,
     Text(title,style: robotoRegular.copyWith(fontSize: Dimensions.fontSizeDefault,fontWeight: FontWeight.bold),),
     SizedBoxSpace.w16,
     Container(height: 1,width:100,color: Theme.of(context).highlightColor),
    ],);
  }
}
