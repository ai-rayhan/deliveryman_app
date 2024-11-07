
import 'package:deliveryman_app/app/data/urls.dart';
import 'package:deliveryman_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:deliveryman_app/app/modules/support/domain/response/help_support_response.dart';
import 'package:deliveryman_app/app/modules/support/domain/response/privacy_policy_response.dart';
import 'package:deliveryman_app/core/api_response.dart';
import 'package:deliveryman_app/core/network_caller/network_caller.dart';
import 'package:deliveryman_app/core/network_caller/request_return_object.dart';

class SupportService {
  Future<ApiResponse<HelpAndSupportResponse>> helpAndSupportInfoService() async {
    NetworkCallerReturnObject response = await GetRequest.execute(Urls.helpAndSupport, token: AuthController.token);
    if (response.success) {
      return ApiResponse.success(HelpAndSupportResponse.fromJson(response.returnValue), responseCode: response.responseCode);
    } else {
      return ApiResponse.error(response.errorMessage, responseCode: response.responseCode);
    }
  }
  Future<ApiResponse<PrivacyPolicyResponse>> policyInfoService(String url) async {
    NetworkCallerReturnObject response = await GetRequest.execute(url, token: AuthController.token);
    if (response.success) {
      return ApiResponse.success(PrivacyPolicyResponse.fromJson(response.returnValue), responseCode: response.responseCode);
    } else {
      return ApiResponse.error(response.errorMessage, responseCode: response.responseCode);
    }
  }
}
