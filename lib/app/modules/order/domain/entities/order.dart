import 'dart:convert';

import 'package:deliveryman_app/app/modules/auth/domain/entities/user.dart';

// Class to represent the options
class ProductOptions {
  String? image;
  String? sizename;
  String? colorname;

  ProductOptions({
    required this.image,
    required this.sizename,
    required this.colorname,
  });

  factory ProductOptions.fromJson(Map<String, dynamic> json) {
    return ProductOptions(
      image: json['image'],
      sizename: json['sizename'],
      colorname: json['colorname'],
    );
  }
}
class CartProduct {
  int id;
  String name;
  int qty;
  ProductOptions options;
  double price;

  CartProduct({
    required this.id,
    required this.name,
    required this.qty,
    required this.options,
    required this.price,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      id: json['id'] is String ? int.parse(json['id']) : json['id'],
      name: json['name'],
      qty: json['qty'] is String ? int.parse(json['qty']) : json['qty'],
      options: ProductOptions.fromJson(json['options']),
      price: json['price'] is String ? double.parse(json['price']) : json['price'].toDouble(),
    );
  }
}


// Class to represent the cart
class Cart {
  List<CartProduct> products;

  Cart({required this.products});

  factory Cart.fromJson(List<dynamic> json) {
    List<CartProduct> productsList = json.map((product) => CartProduct.fromJson(product)).toList();
    return Cart(products: productsList);
  }
}

class OrderDetail {
  final int id;
  final int orderId;
  final dynamic productId;
  final String productTitle;
  final String? productColor;
  final String? productSize;
  final String? productImage;
  final int productQty;
  final double productPrice;
  final double subTotal;
  final DateTime createdAt;
  final DateTime updatedAt;

  OrderDetail({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.productTitle,
    required this.productColor,
    required this.productSize,
    required this.productImage,
    required this.productQty,
    required this.productPrice,
    required this.subTotal,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to create an instance from JSON
  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      id: json['id'],
      orderId: int.parse(json['order_id'].toString()),
      productId: json['product_id'],
      productTitle: json['product_title'],
      productColor: json['product_color'],
      productSize: json['product_size'],
      productImage: json['product_image'],
      productQty: int.parse(json['product_qty'].toString()),
      productPrice: double.parse(json['product_price'].toString()),
      subTotal: double.parse(json['sub_total'].toString()),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

// Order class to represent the whole order
class Order {
  final int id;
  final dynamic userId;
  final String? customerName;
  final String contactEmail;
  final Cart cartJson;
  final double subTotal;
  final double discount;
  final String? couponCode;
  final double? couponAmount;
  final double? tax;
  final double grandTotal;
  final dynamic paid;
  final int paymentMethodId;
  final String? transactionId;
  final String? orderNote;
  final String? attachments;
  final String? completedFiles;
  final dynamic createdBy;
  final dynamic modifiedBy;
  final int orderStatus;
  final dynamic paymentStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<OrderDetail> details;
  final User? user;

  Order({
    required this.id,
    required this.userId,
    required this.customerName,
    required this.contactEmail,
    required this.cartJson,
    required this.subTotal,
    required this.discount,
     this.couponCode,
    required this.couponAmount,
    required this.tax,
    required this.grandTotal,
    required this.paid,
    required this.paymentMethodId,
    required this.transactionId,
    required this.orderNote,
    required this.attachments,
    required this.completedFiles,
    required this.createdBy,
    required this.modifiedBy,
    required this.orderStatus,
    required this.paymentStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.details,
    required this.user,
  });

  // Factory method to create an instance from JSON
  factory Order.fromJson(Map<String, dynamic> json) {
    var detailsList = json['detail'] as List;
    List<OrderDetail> details = detailsList.isNotEmpty
        ? detailsList.map((i) => OrderDetail.fromJson(i)).toList()
        : [];
     Cart cart = Cart.fromJson(jsonDecode(json['cart_json']));
    return Order(
      id: json['id'],
      userId: json['user_id'],
      customerName: json['customer_name'],
      contactEmail: json['contact_email'],
      cartJson: cart,
      subTotal: double.parse(json['sub_total'].toString()),
      discount:double.tryParse(json['discount'].toString())??0.0,
      couponCode: json['coupon_code'],
      couponAmount: double.tryParse(json['coupon_amount'].toString()),
      tax: double.tryParse(json['tax'].toString()),
      grandTotal: double.tryParse(json['grand_total'].toString())??0.0,
      paid: json['paid'],
      paymentMethodId: int.parse(json['payment_method_id'].toString()),
      transactionId: json['transaction_id'],
      orderNote: json['order_note'],
      attachments: json['attachments'],
      completedFiles: json['completed_files'],
      createdBy: json['created_by'],
      modifiedBy: json['modified_by'],
      orderStatus: int.parse(json['order_status'].toString()),
      paymentStatus: json['payment_status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      details: details,
    );
  }
}
