import 'package:deliveryman_app/app/modules/order/domain/entities/order.dart';

class OrdersResponse {
  int currentPage;
  List<Order> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String? nextPageUrl;
  String path;
  int perPage;
  String? prevPageUrl;
  int to;
  int total;

  OrdersResponse({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory OrdersResponse.fromJson(Map<String, dynamic> json) {
    return OrdersResponse(
      currentPage: json['current_page'],
      data: (json['data'] as List).map((e) => Order.fromJson(e)).toList(),
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }
}

// class Order {
//   int id;
//   int userId;
//   String? customerName;
//   String contactEmail;
//   String cartJson;
//   int subTotal;
//   int discount;
//   String couponCode;
//   int couponAmount;
//   int tax;
//   int grandTotal;
//   int paid;
//   int paymentMethodId;
//   String? transactionId;
//   String orderNote;
//   String? attachments;
//   String? completedFiles;
//   int createdBy;
//   int? modifiedBy;
//   int orderStatus;
//   int paymentStatus;
//   String createdAt;
//   String updatedAt;
//   List<Detail> detail;

//   Order({
//     required this.id,
//     required this.userId,
//     this.customerName,
//     required this.contactEmail,
//     required this.cartJson,
//     required this.subTotal,
//     required this.discount,
//     required this.couponCode,
//     required this.couponAmount,
//     required this.tax,
//     required this.grandTotal,
//     required this.paid,
//     required this.paymentMethodId,
//     this.transactionId,
//     required this.orderNote,
//     this.attachments,
//     this.completedFiles,
//     required this.createdBy,
//     this.modifiedBy,
//     required this.orderStatus,
//     required this.paymentStatus,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.detail,
//   });

//   factory Order.fromJson(Map<String, dynamic> json) {
//     return Order(
//       id: json['id'],
//       userId: json['user_id'],
//       customerName: json['customer_name'],
//       contactEmail: json['contact_email'],
//       cartJson: json['cart_json'],
//       subTotal: json['sub_total'],
//       discount: json['discount'],
//       couponCode: json['coupon_code'],
//       couponAmount: json['coupon_amount'],
//       tax: json['tax'],
//       grandTotal: json['grand_total'],
//       paid: json['paid'],
//       paymentMethodId: json['payment_method_id'],
//       transactionId: json['transaction_id'],
//       orderNote: json['order_note'],
//       attachments: json['attachments'],
//       completedFiles: json['completed_files'],
//       createdBy: json['created_by'],
//       modifiedBy: json['modified_by'],
//       orderStatus: json['order_status'],
//       paymentStatus: json['payment_status'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//       detail: (json['detail'] as List).map((e) => Detail.fromJson(e)).toList(),
//     );
//   }
// }

// class Detail {
//   int id;
//   int orderId;
//   int productId;
//   String productColor;
//   String productSize;
//   String productImage;
//   int productQty;
//   int productPrice;
//   int subTotal;
//   String createdAt;
//   String updatedAt;

//   Detail({
//     required this.id,
//     required this.orderId,
//     required this.productId,
//     required this.productColor,
//     required this.productSize,
//     required this.productImage,
//     required this.productQty,
//     required this.productPrice,
//     required this.subTotal,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   factory Detail.fromJson(Map<String, dynamic> json) {
//     return Detail(
//       id: json['id'],
//       orderId: json['order_id'],
//       productId: json['product_id'],
//       productColor: json['product_color'],
//       productSize: json['product_size'],
//       productImage: json['product_image'],
//       productQty: json['product_qty'],
//       productPrice: json['product_price'],
//       subTotal: json['sub_total'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//     );
//   }
// }
