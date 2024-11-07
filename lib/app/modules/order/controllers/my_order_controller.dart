// import 'package:deliveryman_app/app/data/urls.dart';
// import 'package:deliveryman_app/app/modules/my_order/domain/entities/category.dart';
// import 'package:deliveryman_app/app/modules/my_order/domain/response/order_response.dart';
// import 'package:deliveryman_app/app/modules/my_order/domain/services/order_service.dart';
// import 'package:deliveryman_app/core/api_response.dart';
// import 'package:get/get.dart';

// class MyOrderController extends GetxController {
 
//   OrdersResponse? productResponse;
//   List<Order> products=[];
//   bool inProgress=false;
//   String? errorMessage = '';
//   final OrderService productService = OrderService();
//   int page=1;
//   bool isLastPage=false;

//   void clearProducts(){
//     products=[];
//     page=1;
//     isLastPage=false;
//     update();
//   }

//  Future<bool> getProducts( {required String endpoint,bool refresh=false, String? categoryId,String? brandId})async{

//   if(refresh){
//     clearProducts();
//   }
//   if(isLastPage){
//     return false;
//   }
//    inProgress=true;
//    update();
//    ApiResponse<OrderResponse> result = await productService.getCategories("${Urls.runningOrders}?page=$page");
//   if (result.isSuccess) {
//   productResponse = result.data;
//   products.addAll(productResponse!.orders);
//   if(productResponse!.nextPageUrl!=null ){
//     page++;
//   }else{
//     isLastPage=true;
//   }
//   inProgress=false;
//   update();
//   return true;
//   } else {
//   errorMessage=result.error;
//   inProgress=false;
//   update();
//   return false;
//   }
//  }
// }
