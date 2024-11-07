import 'package:deliveryman_app/helper/date_converter.dart';

class User {
  final int id;
  final String? authId;
  final String username;
  final String email;
  final String? firstname;
  final String? lastname;
  final String? mobile;
  final String? company;
  final String? address;
  final String? country;
  final String? state;
  final String? city;
  final String? zip;
  final String? billingFirstname;
  final String? billingLastname;
  final String? billingMobile;
  final String? billingCompany;
  final String? billingAddress;
  final String? billingCountry;
  final String? billingState;
  final String? billingCity;
  final String? billingZip;
  final String? jobTitle;
  final String? image;
  final dynamic status;
  final dynamic createdAt;
  final dynamic updatedAt;

  User({
    required this.id,
    this.authId,
    required this.username,
    required this.email,
    this.firstname,
    this.lastname,
    this.mobile,
    this.company,
    this.address,
    this.country,
    this.state,
    this.city,
    this.zip,
    this.billingFirstname,
    this.billingLastname,
    this.billingMobile,
    this.billingCompany,
    this.billingAddress,
    this.billingCountry,
    this.billingState,
    this.billingCity,
    this.billingZip,
    this.jobTitle,
    this.image,
    required this.status,
     this.createdAt,
     this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      authId: json['auth_id'],
      username: json['username']??"",
      email: json['email']??'',
      firstname: json['firstname']??"",
      lastname: json['lastname']??"",
      mobile: json['mobile'],
      company: json['company'],
      address: json['address'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
      zip: json['zip'],
      billingFirstname: json['billing_firstname'],
      billingLastname: json['billing_lastname'],
      billingMobile: json['billing_mobile'],
      billingCompany: json['billing_company'],
      billingAddress: json['billing_address'],
      billingCountry: json['billing_country'],
      billingState: json['billing_state'],
      billingCity: json['billing_city'],
      billingZip: json['billing_zip'],
      jobTitle: json['job_title'],
      image: json['image'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt:json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'auth_id': authId,
      'username': username,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'mobile': mobile,
      'company': company,
      'address': address,
      'country': country,
      'state': state,
      'city': city,
      'zip': zip,
      'billing_firstname': billingFirstname,
      'billing_lastname': billingLastname,
      'billing_mobile': billingMobile,
      'billing_company': billingCompany,
      'billing_address': billingAddress,
      'billing_country': billingCountry,
      'billing_state': billingState,
      'billing_city': billingCity,
      'billing_zip': billingZip,
      'job_title': jobTitle,
      'image': image,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  String joinedDate() {
    return DateConverter.yyyyMMDD(createdAt);
  }
}
