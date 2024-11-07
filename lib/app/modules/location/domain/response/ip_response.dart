
import 'package:deliveryman_app/app/modules/location/domain/entities/ip_location.dart';

class IpInfoResponse {
  // final String ip;
  // final String type;
  // final Carrier carrier;
  // final Company company;
  // final Connection connection;
  // final Currency currency;
  final Location location;
  // final Security security;
  // final TimeZone timeZone;

  IpInfoResponse({
    // required this.ip,
    // required this.type,
    // required this.carrier,
    // required this.company,
    // required this.connection,
    // required this.currency,
    required this.location,
    // required this.security,
    // required this.timeZone, 
     });

  factory IpInfoResponse.fromJson(Map<String, dynamic> json) {
    return IpInfoResponse(
      // ip: json['ip'],
      // type: json['type'],
      // carrier: Carrier.fromJson(json['carrier']),
      // company: Company.fromJson(json['company']),
      // connection: Connection.fromJson(json['connection']),
      // currency: Currency.fromJson(json['currency']),
      location: Location.fromJson(json['location']),
      // security: Security.fromJson(json['security']),
      // timeZone: TimeZone.fromJson(json['time_zone']),
    );
  }
}
