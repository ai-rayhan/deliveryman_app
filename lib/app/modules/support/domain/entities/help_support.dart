
class HelpAndSupportInfo {
  final String mobile;
  final String email;
  final String address;

  HelpAndSupportInfo({
    required this.mobile,
    required this.email,
    required this.address,
  });

  factory HelpAndSupportInfo.fromJson(Map<String, dynamic> json) {
    return HelpAndSupportInfo(
      mobile: json['mobile'],
      email: json['email'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mobile': mobile,
      'email': email,
      'address': address,
    };
  }
}
