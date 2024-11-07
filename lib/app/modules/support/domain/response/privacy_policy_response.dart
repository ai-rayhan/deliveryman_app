
import 'dart:convert';

import 'package:deliveryman_app/app/modules/support/domain/entities/privacy_policy.dart';

class PrivacyPolicyResponse {
  final PrivacyPolicy privacyPolicy;

  PrivacyPolicyResponse({required this.privacyPolicy});

  factory PrivacyPolicyResponse.fromJson(dynamic json) {
    return PrivacyPolicyResponse(
      privacyPolicy: PrivacyPolicy.fromJson(json as Map<String, dynamic>),
    );
  }

  String toJson() {
    final jsonData = privacyPolicy.toJson();
    return json.encode(jsonData);
  }
}
