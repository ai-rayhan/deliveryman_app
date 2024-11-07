import 'dart:convert';

import 'package:deliveryman_app/app/modules/support/domain/entities/help_support.dart';

class HelpAndSupportResponse {
  final HelpAndSupportInfo customer;

  HelpAndSupportResponse({required this.customer});

  factory HelpAndSupportResponse.fromJson(dynamic json) {
    return HelpAndSupportResponse(
      customer: HelpAndSupportInfo.fromJson(json as Map<String, dynamic>),
    );
  }

  String toJson() {
    final jsonData = customer.toJson();
    return json.encode(jsonData);
  }
}
