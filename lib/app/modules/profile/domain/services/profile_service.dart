import 'package:deliveryman_app/app/data/urls.dart';
import 'package:deliveryman_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:deliveryman_app/core/network_caller/network_caller.dart';
import 'package:deliveryman_app/core/network_caller/request_return_object.dart';


class ProfileService{

   Future<NetworkCallerReturnObject> getUserProfile()async{
    NetworkCallerReturnObject response = await GetRequest.execute(Urls.profile,token: AuthController.token);
    return response;
   }
  Future<NetworkCallerReturnObject> updateUserProfile(String firstName,String lastName,String email)async{
    NetworkCallerReturnObject response = await PostRequest.execute(Urls.updateProfile,{
      'first_name':firstName,'last_name':lastName,'email':email},token: AuthController.token);
    return response;
   }
}