import 'package:flutter/widgets.dart';

class Address{
  String address;
  double lat;
  double lng;

  Address({
    @required this.address,
    @required this.lat,
    @required this.lng
  });

  static Address fromMap(Map<String, dynamic> addressData){
    return Address(address: addressData['address'],lat: addressData['lat'],lng: addressData['lng']);
  }
}