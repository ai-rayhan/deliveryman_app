import 'package:deliveryman_app/app/data/urls.dart';
import 'package:deliveryman_app/app/modules/location/domain/response/ip_response.dart';
import 'package:deliveryman_app/core/api_response.dart';
import 'package:deliveryman_app/core/network_caller/network_caller.dart';
import 'package:deliveryman_app/core/network_caller/request_return_object.dart';

class LocationService {
  LocationService();

  Future<ApiResponse<IpInfoResponse>> getIpInfo() async {
    NetworkCallerReturnObject response = await GetRequest.execute(Urls.getIpInfo);
    if (response.success) {
      return ApiResponse.success(IpInfoResponse.fromJson(response.returnValue), responseCode: response.responseCode);
    } else {
      return ApiResponse.error(response.errorMessage, responseCode: response.responseCode);
    }
  }
}
