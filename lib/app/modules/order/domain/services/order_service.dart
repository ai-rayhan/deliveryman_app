import 'dart:developer';
import 'package:deliveryman_app/app/data/urls.dart';
import 'package:deliveryman_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:deliveryman_app/app/modules/order/domain/entities/order.dart';
import 'package:deliveryman_app/app/modules/order/domain/response/order_response.dart';
import 'package:deliveryman_app/core/api_response.dart';
import 'package:deliveryman_app/core/network_caller/network_caller.dart';
import 'package:deliveryman_app/core/network_caller/request_methods/dynamic_post_request.dart';
import 'package:deliveryman_app/core/network_caller/request_return_object.dart';

class OrderService {
  Future<ApiResponse<OrdersResponse>> getOrders(String url) async {
    log(AuthController.token ?? "");
    NetworkCallerReturnObject response = await GetRequest.execute(url, token: AuthController.token);
    if (response.success) {
      return ApiResponse.success(OrdersResponse.fromJson(response.returnValue), responseCode: response.responseCode);
    } else {
      return ApiResponse.error(response.errorMessage, responseCode: response.responseCode);
    }
  }
  Future<ApiResponse<Order>> getOrderDetails(int orderId) async {
    log(AuthController.token ?? "");
    NetworkCallerReturnObject response = await DynamicPostRequest.execute(Urls.orderDetails,{
      'order_id':orderId
    }, token: AuthController.token);
    if (response.success) {
      return ApiResponse.success(Order.fromJson(response.returnValue), responseCode: response.responseCode);
    } else {
      return ApiResponse.error(response.errorMessage, responseCode: response.responseCode);
    }
  }
  Future<ApiResponse> cancelOrder(int orderId) async {
    log(AuthController.token ?? "");
    NetworkCallerReturnObject response = await DynamicPostRequest.execute(Urls.cancelOrder,{
      'order_id':orderId
    }, token: AuthController.token);
    if (response.success) {
      return ApiResponse.success(response.returnValue, responseCode: response.responseCode);
    } else {
      return ApiResponse.error(response.errorMessage, responseCode: response.responseCode);
    }
  }
}
