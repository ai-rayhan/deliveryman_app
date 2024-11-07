import 'package:deliveryman_app/app/modules/profile/domain/entities/user.dart';
import 'package:deliveryman_app/app/modules/profile/domain/models/profile_response.dart';
import 'package:deliveryman_app/app/modules/profile/domain/services/profile_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final ProfileService _profileService=ProfileService();
  User? userProfile;
  
  bool inProgress=false;
  String errorMessage = '';

 ProfileResponse? profileResponse;
  Future<bool> getUserProfile()async{
    final response = await _profileService.getUserProfile();
    if(response.success){
    profileResponse=ProfileResponse.fromJson(response.returnValue);
    userProfile=profileResponse!.user;
    update();
    }else{
      errorMessage=response.errorMessage;
      update();
    }
    return response.success;
  }
  Future<bool> updateProfile(String firstName,String lastName,String email)async{
    final response = await _profileService.updateUserProfile(firstName,lastName,email);
    if(response.success){
    final profileResponse=ProfileResponse.fromJson(response.returnValue);
    userProfile=profileResponse.user;
    update();
    }else{
      errorMessage=response.errorMessage;
      update();
    }
    return response.success;
  }
}
