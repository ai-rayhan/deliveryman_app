import 'dart:convert';
import 'package:deliveryman_app/app/data/preferences_key.dart';
import 'package:deliveryman_app/app/modules/auth/domain/entities/user.dart';
import 'package:deliveryman_app/app/modules/auth/domain/models/login_response.dart';
import 'package:deliveryman_app/app/modules/auth/domain/services/auth_service.dart';
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:deliveryman_app/core/api_response.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  
  static String? token;
  static String? userAddress;
  // static int? userId;
  // static int? userRole;
  // static bool? isActiveUser=true;
  // static bool isPhoneVerifiedUser =false;
  static User? user;

  bool inProgress=false;
  String errorMessage = '';


  final AuthService _authService=AuthService();


  Future<bool>signupWithPhoneAndPassword({required String firstName,required String lastName, required String mobile,required confirmPassword, required String email,required String password})async{
    final response = await _authService.signUpWithPhoneAndPassword(firstName: firstName, lastName: lastName, mobile: mobile, confirmPassword: confirmPassword, email: email, password: password);
    if(response.success){
    update();
    }else{
      errorMessage=response.error??'';
      update();
    }
    return response.success;
  }

   Future<bool> verifyRegistrationPhoneOtp(String phone, String otp)async{
    inProgress=true;
    update();
    ApiResponse<LoginResponse> result = await _authService.verifyRegisterPhoneOtp(phone, otp);
     if (result.isSuccess) {
    token=result.data?.token;
    user=result.data?.user;
    await saveUserDetails(token??'', result.data!.user);
     inProgress=false;
     update();
     return true;
     } else {
     errorMessage=result.error.toString();
     inProgress=false;
     update();
     return false;
     }
    }
    
  Future<bool>signInWithPhoneAndPassword(String phone,String password)async{
    final ApiResponse<LoginResponse> response = await _authService.signInWithPhoneAndPassword(phone, password);
    if(response.success){
    final loginResponse=response.data!;
    token=loginResponse.token;
    user=loginResponse.user;
    await saveUserDetails(token??'', loginResponse.user);
    update();
    }else{
      errorMessage=response.error??'';
      update();
    }
    return response.success;
  }

  Future<bool>signupWithPhone({required String mobile})async{
    inProgress=true;
    update();
    final response = await _authService.signUpWithPhone(mobile);
    if(response.success){
    inProgress=false;
    update();
    }else{
      errorMessage=response.error??'';
      inProgress=false;
      update();
    }
    return response.success;
  }
  Future<bool>verifyPhoneOTPAndLogin( String mobile, String otp)async{
    inProgress=true;
    update();
    final response = await _authService.verifyPhoneOTPAndLogin(mobile,otp);
    if(response.success){
    token=response.data?.token;
    user=response.data?.user;
    await saveUserDetails(token??'', response.data!.user);
     inProgress=false;
     update();
    }else{
      errorMessage=response.error??'';
      inProgress=false;
      update();
    }
    return response.success;
  }

   Future<void>saveUserDetails(String token, User user)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(PrefsKey.user, jsonEncode(user.toJson()));
    await sharedPreferences.setString(PrefsKey.token, token);
   }
   Future<void>getUserDetails()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final userFromPrefs = sharedPreferences.getString(PrefsKey.user);
    final tokenFromPrefs = sharedPreferences.getString(PrefsKey.token);
    if (userFromPrefs != null && tokenFromPrefs != null) {
      user= User.fromJson(jsonDecode(userFromPrefs));
      token=tokenFromPrefs;
      if(user?.billingAddress!=null){
       userAddress=user?.billingAddress;
      }else{
       userAddress=user?.address;
      }
    }
   }
   Future<void> signOut() async {
     final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     await sharedPreferences.remove(PrefsKey.user);
     await sharedPreferences.remove(PrefsKey.token);
  }

  bool isGlobalSignOut = false;
   globalSignOutChecked() async { 
    isGlobalSignOut=!isGlobalSignOut;
    update();
   }
   Future<bool> signOutFromAllDevices() async {
    final response = await _authService.signOut();
    if (response.success) {
      await signOut();
      Get.toNamed(Routes.signIn);
      return true;
    }else{
      return false;
    }
  }
  
  
   Future<bool> sendOtp(String phone)async{
    inProgress=true;
    update();
    ApiResponse result = await _authService.sendOtp(phone);
     if (result.isSuccess) {
    inProgress=false;
     update();
     return true;
     } else {
     errorMessage=result.error.toString();
     inProgress=false;
     update();
     return false;
     }
    }
   Future<bool> verifyOtp(String phone,String otp)async{
    inProgress=true;
    update();
    ApiResponse result = await _authService.verifyOtp(phone,otp);
     if (result.isSuccess) {
    inProgress=false;
     update();
     return true;
     } else {
     errorMessage=result.error.toString();
     inProgress=false;
     update();
     return false;
     }
    }
  
   Future<bool> resetPassword(String phone, String otp, String password)async{
    inProgress=true;
    update();
    ApiResponse result = await _authService.resetPassword(phone, otp,password);
     if (result.isSuccess) {
    inProgress=false;
     update();
     return true;
     } else {
     errorMessage=result.error.toString();
     inProgress=false;
     update();
     return false;
     }
    }
}