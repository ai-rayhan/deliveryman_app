
// import 'dart:async';

// import 'package:deliveryman_app/app/data/urls.dart';
// import 'package:deliveryman_app/app/modules/auth/domain/services/auth_service.dart';
// import 'package:deliveryman_app/core/api_response.dart';
// import 'package:deliveryman_app/core/network_caller/request_methods/post_request.dart';
// import 'package:deliveryman_app/core/network_caller/request_return_object.dart';
// import 'package:get/get.dart';

// class VerifyOTPController extends GetxController {
//   bool inProgress = false;
//   String errorMessage = '';
//   AuthService authService = AuthService();
//   int countdown = 60;
//   bool buttonEnabled = false;
//   late Timer timer;

//   void startCountdown() {
//     timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
//       countdown--;
//       update();
//       if (countdown <= 0) {
//         buttonEnabled = true;
//         timer.cancel();
//         update();
//       }
//     });
//   }


//   void countStart() {
//     if (countdown == 0) {
//       countdown=60;
//       buttonEnabled = false;
//       update();
//     }
//   }
//   //  Future<bool> sendOtpToPhone(String phone) async {
//   //   _inProgress = true;
//   //   update();
//   //    final  NetworkCallerReturnObject response =await PostRequest.execute(Urls.sendOtpToPhone, {
//   //       'phone_number':phone,
//   //   }, isLogin: true);
//   //   _inProgress = false;
//   //   if (response.success) {
//   //     update();
//   //     return true;
//   //   } else {
//   //     _errorMessage = response.errorMessage;
//   //     update();
//   //     return false;
//   //   }
//   // }
//   Future<bool> verifyOtp(String phone, String otp)async{
//    inProgress=true;
//    update();
//    ApiResponse result = await authService.verifyPhoneOtp(phone, otp);
//   if (result.isSuccess) {
//   inProgress=false;
//   update();
//   return true;
//   } else {
//   errorMessage=result.error.toString();
//   inProgress=false;
//   update();
//   return false;
//   }
//  }
// }
