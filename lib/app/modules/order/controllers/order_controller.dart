import 'package:deliveryman_app/app/modules/order/domain/entities/order.dart';
import 'package:deliveryman_app/app/modules/order/domain/response/order_response.dart';
import 'package:deliveryman_app/app/modules/order/domain/services/order_service.dart';
import 'package:deliveryman_app/core/api_response.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
 
  OrdersResponse? productResponse;
  List<Order> products=[];
  bool inProgress=false;
  String? errorMessage = '';
  final OrderService productService = OrderService();
  int page=1;
  bool isLastPage=false;

  void clearProducts(){
    products=[];
    page=1;
    isLastPage=false;
    update();
  }

 Future<bool> getOrders( {required String url,bool refresh=false})async{

  if(refresh){
    clearProducts();
  }
  if(isLastPage){
    return false;
  }
   inProgress=true;
   update();
   ApiResponse<OrdersResponse> result = await productService.getOrders("$url?page=$page");
  if (result.isSuccess) {
  productResponse = result.data;
  products.addAll(productResponse!.data);
  if(productResponse!.nextPageUrl!=null ){
    page++;
  }else{
    isLastPage=true;
  }
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

 Order? order;
 //order details
 Future<bool> getOrderDetails({required int orderId})async{
  ApiResponse result = await productService.getOrderDetails(orderId);
  inProgress=true;
  update();
  if (result.isSuccess) {
    order=result.data;
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
 
//cancel order
 Future<bool> cancelOrder({required int orderId})async{
  ApiResponse result = await productService.cancelOrder(orderId);
  inProgress=true;
  update();
  if (result.isSuccess) {
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
