import 'package:deliveryman_app/app/data/urls.dart';
import 'package:deliveryman_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:deliveryman_app/app/modules/auth/domain/models/login_response.dart';
import 'package:deliveryman_app/app/modules/location/controllers/location_controller.dart';
import 'package:deliveryman_app/core/api_response.dart';
import 'package:deliveryman_app/core/network_caller/network_caller.dart';
import 'package:deliveryman_app/core/network_caller/request_methods/dynamic_post_request.dart';
import 'package:deliveryman_app/core/network_caller/request_return_object.dart';
import 'package:get/get.dart';

class AuthService{
   Future <ApiResponse> signUpWithPhoneAndPassword({required String firstName,required String lastName, required String mobile,required confirmPassword, required String email,required String password})async{
    LocationController locationController = Get.find();
    NetworkCallerReturnObject response = await DynamicPostRequest.execute(Urls.signUp, {
      "first_name":firstName ,
      "last_name": lastName,
      "mobile": mobile,
      "email": email,
      "password": password,
      "password_confirmation": confirmPassword,
      //personal address optinal
      'address':locationController.address,
      'country':locationController.country,
      'city':locationController.city,
      "zip":locationController.zip,
       //billing address optional
      'billing_firstname':firstName,
      'billing_lastname':lastName,
      'billing_mobile':mobile,
      "billing_address":locationController.address,
      'billing_zip':locationController.zip,
      'billing_city':locationController.city,
      'billing_country':locationController.country,

    }, isLogin: false);
    if(response.success){
      return ApiResponse.success(response.returnValue,responseCode: response.responseCode);
    } else {
      return ApiResponse.error(response.errorMessage,responseCode:response.responseCode );
    }
   }

   Future<ApiResponse<LoginResponse>> signInWithPhoneAndPassword(String phone,String password)async{
    NetworkCallerReturnObject response = await DynamicPostRequest.execute(Urls.signIn, {
      'mobile': phone,
      'password': password,
    }, isLogin: false);
    if(response.success){
      return ApiResponse.success(LoginResponse.fromJson(response.returnValue),responseCode: response.responseCode);
    } else {
      return ApiResponse.error(response.errorMessage,responseCode:response.responseCode );
    }
   }
   Future<ApiResponse<LoginResponse>> verifyRegisterPhoneOtp(String phone,String otp)async{
    NetworkCallerReturnObject response = await DynamicPostRequest.execute(Urls.verifyRegistrationPhoneOtp, {
      'mobile': phone,
      'otp': otp,
    }, isLogin: false);
    if(response.success){
      return ApiResponse.success(LoginResponse.fromJson(response.returnValue),responseCode: response.responseCode);
    } else {
      return ApiResponse.error(response.errorMessage,responseCode:response.responseCode );
    }
   }

    Future<ApiResponse> sendOtp(String phone)async{
    NetworkCallerReturnObject response = await DynamicPostRequest.execute(Urls.sendOtp, {
      'mobile': phone,
    }, isLogin: false);
    if(response.success){
      return ApiResponse.success(response.returnValue,responseCode: response.responseCode);
    } else {
      return ApiResponse.error(response.errorMessage,responseCode:response.responseCode );
    }
   }
    Future<ApiResponse> verifyOtp(String phone,String otp)async{
    NetworkCallerReturnObject response = await DynamicPostRequest.execute(Urls.verifyOtp, {
      'mobile': phone,
      'otp':otp
    }, isLogin: false);
    if(response.success){
      return ApiResponse.success(response.returnValue,responseCode: response.responseCode);
    } else {
      return ApiResponse.error(response.errorMessage,responseCode:response.responseCode );
    }
   }
    Future<ApiResponse> resetPassword(String phone, String otp, String password)async{
    NetworkCallerReturnObject response = await DynamicPostRequest.execute(Urls.resetPassword, {
         "mobile": phone,
         "otp": otp,
         "password": password,
         "password_confirmation": password

    }, isLogin: false);
    if(response.success){
      return ApiResponse.success(response.returnValue,responseCode: response.responseCode);
    } else {
      return ApiResponse.error(response.errorMessage,responseCode:response.responseCode );
    }
   }
   Future<ApiResponse> signUpWithPhone(String phone)async{
    NetworkCallerReturnObject response = await DynamicPostRequest.execute(Urls.signUpPhone, {
      'mobile': phone,
    }, isLogin: false);
    if(response.success){
      return ApiResponse.success(response.returnValue,responseCode: response.responseCode);
    } else {
      return ApiResponse.error(response.errorMessage,responseCode:response.responseCode );
    }
   }

  Future<ApiResponse<LoginResponse>> verifyPhoneOTPAndLogin(String phone,String otp)async{
    LocationController locationController = Get.find();
    NetworkCallerReturnObject response = await DynamicPostRequest.execute(Urls.verifyPhoneOtpAndLogin, {
      'valid_mobile': phone,
      'otp':otp,
        //personal address optinal
      'address':locationController.address,
      'country':locationController.country,
      'city':locationController.city,
      "zip":locationController.zip,
       //billing address optional
      'billing_mobile':phone,
      "billing_address":locationController.address,
      'billing_zip':locationController.zip,
      'billing_city':locationController.city,
      'billing_country':locationController.country,
    }, isLogin: false);
    if(response.success){
      return ApiResponse.success(LoginResponse.fromJson(response.returnValue),responseCode: response.responseCode);
    } else {
      return ApiResponse.error(response.errorMessage,responseCode:response.responseCode );
    }
   }
   Future<ApiResponse<dynamic>> signOut()async{
    NetworkCallerReturnObject response = await PostRequest.execute(Urls.logout, {},token: AuthController.token);
    if (response.success) {
     return ApiResponse.success(response.returnValue, responseCode: response.responseCode);
    }else{
     return ApiResponse.error(response.errorMessage, responseCode: response.responseCode);
    }
   }

}