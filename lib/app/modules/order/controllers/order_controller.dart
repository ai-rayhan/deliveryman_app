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
  productResponse = dummyResponse;
  products.addAll(productResponse!.data);
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
  order=dummyResponse.data[0];
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
 OrdersResponse dummyResponse = OrdersResponse(
    currentPage: 1,
    data: [
      Order.fromJson({
        'id': 1,
        'user_id': 123,
        'customer_name': 'John Doe',
        'contact_email': 'johndoe@example.com',
        'cart_json': '{"products":[{"id":1,"name":"T-shirt","qty":2,"options":{"image":"image_url","sizename":"M","colorname":"Red"},"price":19.99}]}',
        'sub_total': 39.98,
        'discount': 5.0,
        'coupon_code': 'SUMMER21',
        'coupon_amount': 10.0,
        'tax': 4.0,
        'grand_total': 38.98,
        'paid': 38.98,
        'payment_method_id': 1,
        'transaction_id': 'abc123',
        'order_note': 'Please deliver on time',
        'attachments': null,
        'completed_files': null,
        'created_by': 1,
        'modified_by': null,
        'order_status': 1,
        'payment_status': 1,
        'created_at': '2024-11-01T10:00:00Z',
        'updated_at': '2024-11-01T12:00:00Z',
        'detail': [
          {
            'id': 1,
            'order_id': 1,
            'product_id': 1,
            'product_title': 'T-shirt',
            'product_color': 'Red',
            'product_size': 'M',
            'product_image': 'image_url',
            'product_qty': 2,
            'product_price': 19.99,
            'sub_total': 39.98,
            'created_at': '2024-11-01T10:00:00Z',
            'updated_at': '2024-11-01T10:00:00Z'
          }
        ],
        'user': {
          'id': 123,
          'name': 'John Doe',
          'email': 'johndoe@example.com',
        }
      }),
    ],
    firstPageUrl: '/orders?page=1',
    from: 1,
    lastPage: 5,
    lastPageUrl: '/orders?page=5',
    nextPageUrl: '/orders?page=2',
    path: '/orders',
    perPage: 10,
    prevPageUrl: null,
    to: 10,
    total: 50,
  );