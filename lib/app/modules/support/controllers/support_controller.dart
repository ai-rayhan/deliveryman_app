
import 'package:deliveryman_app/app/modules/support/domain/response/help_support_response.dart';
import 'package:deliveryman_app/app/modules/support/domain/response/privacy_policy_response.dart';
import 'package:deliveryman_app/app/modules/support/domain/services/support_service.dart';
import 'package:deliveryman_app/core/api_response.dart';
import 'package:get/get.dart';

class SupportController extends GetxController {

  bool inProgress=false;
  String? errorMessage = '';
  final SupportService supportService = SupportService();

  HelpAndSupportResponse? helpAndSupportResponse;
  PrivacyPolicyResponse? privacyPolicyResponse;

 Future<bool> getHelpAndSupportInfo()async{
   inProgress=true;
   update();
   ApiResponse<HelpAndSupportResponse> result = await supportService.helpAndSupportInfoService();
  if (result.isSuccess) {
  helpAndSupportResponse = result.data;
  inProgress=false;
  update();
  return true;
  } else {
  errorMessage=result.error;
  inProgress=false;
  update();
  return false;
  }
 }
 Future<bool> getPrivacyInfo(String url)async{
   inProgress=true;
   update();
   ApiResponse<PrivacyPolicyResponse> result = await supportService.policyInfoService(url);
  if (result.isSuccess) {
  privacyPolicyResponse = result.data;
  inProgress=false;
  update();
  return true;
  } else {
  errorMessage=result.error;
  inProgress=false;
  update();
  return false;
  }
 }


}