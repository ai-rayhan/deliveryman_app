import 'package:deliveryman_app/app/modules/auth/domain/entities/user.dart';

class ProfileResponse {
  final String message;
  final User user;
  final int? completedOrders;
  final int? processingOrders;
  final int? pendingOrders;
  

  ProfileResponse({
    required this.message,
    required this.user,
    this.completedOrders,
    this.processingOrders,
    this.pendingOrders,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      message: json['status'],
      user: User.fromJson(json['user']),
      completedOrders: json['completedOrders'],
      processingOrders: json['processingOrders'],
      pendingOrders: json['pendingOrders'],
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': message,
      'user': user.toJson(),
      'completedOrders': completedOrders,
      'processingOrders': processingOrders,
      'pendingOrders': pendingOrders,

    };
  }
}
