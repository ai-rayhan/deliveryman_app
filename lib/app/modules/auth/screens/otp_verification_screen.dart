import 'dart:developer';
import 'package:deliveryman_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:deliveryman_app/common/global_widgets/appbar.dart';
import 'package:deliveryman_app/util/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key});


  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  // final VerifyOTPController _otpController=Get.find<VerifyOTPController>();
  final args = Get.arguments;
  @override
  void initState() {
    super.initState();
    // startCountdown();
  }

  // void startCountdown()async {
  //  bool response= await _otpController.sendOtpToPhone(args['phone']);
  //  if(response){
  //  _otpController.startCountdown();
  //  }
  //  else{
  //   Get.snackbar("Wrong", "Phone Number or User Not valid");
  //  }
  // }

  // @override
  // void dispose() {
  //   _otpController.timer.cancel(); 
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    log(args.toString());
    return Scaffold(
      appBar: showAppBar(context: context, text: "otp_verification".tr),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                // const AppLogo(
                //   height: 80,
                // ),
                const SizedBox(
                  height: 24.0,
                ),
                // Text(
                //   'Enter OTP Code',
                //   style: Theme.of(context).textTheme.titleLarge,
                // ),
                // const SizedBox(
                //   height: 4.0,
                // ),
                Text("enter_otp_code".tr,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                PinCodeTextField(
                  controller: _otpTEController,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.center,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldOuterPadding: const EdgeInsets.all(10),
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.transparent,
                    inactiveFillColor: Colors.transparent,
                    inactiveColor:Theme.of(context).disabledColor,
                    selectedFillColor: Colors.transparent,
                    selectedColor: Colors.purple,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (v) {
                    debugPrint("Completed");
                  },
                  appContext: context,
                ),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                  width: double.infinity,
                  child:
                   GetBuilder<AuthController>(
                      builder: (authController) {
                    return Visibility(
                      visible: authController.inProgress == false,
                      replacement: const Center(child: CircularProgressIndicator()),
                      child: 
                      ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            final bool response ;
                            if(args['isForgetPassword']??false){
                              response= await authController
                                .verifyOtp(args['phone'], _otpTEController.text);
                            }else if(args['signupWithPhone']??false){
                                response= await authController
                                .verifyPhoneOTPAndLogin(args['phone'], _otpTEController.text);
                            }else{
                                response= await authController
                                .verifyRegistrationPhoneOtp(args['phone'], _otpTEController.text);
                            }
                            if (response) {
                                if(args['isForgetPassword']??false){
                                  Get.offNamed(Routes.resetPassword,arguments: {'phone': args['phone'],'otp': _otpTEController.text});
                                }else if(args['signupWithPhone']==true && args['isFromCheckout']!=true){
                                    Get.offAllNamed(Routes.bottomNavigationBar);
                                }else if(args['isFromCheckout']??false){
                                  Get.offAllNamed(Routes.checkout);
                                }
                                else{
                                   Get.offAllNamed(Routes.location);
                                }
                            } else {
                              SnackbarHelper.showErrorSnackbar("Error",authController.errorMessage);
                            }
                          }
                        },
                        child:  Text("verify".tr),
                      ),
                    );
                  }),
                ),
                // const SizedBox(
                //   height: 24,
                // ),
                // GetBuilder<VerifyOTPController>(
                //   builder: (timeDecreaseController) {
                //     return RichText(
                //       text: TextSpan(
                //         style: const TextStyle(color: Colors.grey),
                //         children: [
                //           const TextSpan(
                //             text: 'This code will expire',
                //           ),
                //           TextSpan(
                //             text: ' ${timeDecreaseController.countdown }s',
                //             style:  TextStyle(
                //               color: Theme.of(context).primaryColor,
                //               fontWeight: FontWeight.w600,
                //             ),
                //           ),
                //         ],
                //       ),
                //     );
                //   }
                // ),
                // GetBuilder<VerifyOTPController>(
                //   builder: (timeDecreaseController) {
                //     return TextButton(
                //       onPressed: timeDecreaseController.buttonEnabled
                //           ? () {
                //             //  startCountdown();
                //               // timeDecreaseController.countStart();
                //             }
                //           : null,
                //       child: Text(
                //         'Resend Code',
                //         style: TextStyle(
                //           color: timeDecreaseController.buttonEnabled ? Colors.blue : Colors.grey,
                //         ),
                //       ),
                //     );
                //   }
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}