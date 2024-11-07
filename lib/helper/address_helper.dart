// Example address: "Floor 5, House 13, Road 02/A, WFV7+28X, গাজীপুর, Bangladesh"

String getExtractedAddress(String? address, int index) {
  if (address == null) {
    return '';
  }

  List<String> addressList = address.split(',');

  if (address.contains('Floor') && address.contains('House') && address.contains('Road')) {
    if (index == 3) {
      return addressList.sublist(index).join(',').trim();
    } 
    if(index==0){
      return addressList[index].split('Floor').last.trim();
    }else if(index==1){
      return addressList[index].split('House').last.trim();
    }else if(index==2){
      return addressList[index].split('Road').last.trim();
    }
  }else if(index==3){
    return address;
  }
    return '';
}


// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:deliveryman_app/features/splash/controllers/splash_controller.dart';
// import 'package:deliveryman_app/api/api_client.dart';
// import 'package:deliveryman_app/features/address/domain/models/address_model.dart';
// import 'package:deliveryman_app/util/app_constants.dart';

// class AddressHelper {

//   static Future<bool> saveUserAddressInSharedPref(AddressModel address) async {
//     SharedPreferences sharedPreferences = Get.find<SharedPreferences>();
//     String userAddress = jsonEncode(address.toJson());
//     Get.find<ApiClient>().updateHeader(
//       sharedPreferences.getString(AppConstants.token),
//       address.zoneIds,[],
//       sharedPreferences.getString(AppConstants.languageCode),
//       Get.find<SplashController>().module?.id,
//       address.latitude,
//       address.longitude,
//     );
//     return await sharedPreferences.setString(AppConstants.userAddress, userAddress);
//   }

//   static AddressModel? getUserAddressFromSharedPref() {
//     SharedPreferences sharedPreferences = Get.find<SharedPreferences>();
//     AddressModel? addressModel;
//     try {
//       addressModel = AddressModel.fromJson(jsonDecode(sharedPreferences.getString(AppConstants.userAddress)!));
//     }catch(e) {
//       if(!GetPlatform.isWeb) {
//         debugPrint('Address Catch exception : $e');
//       }
//     }
//     return addressModel;
//   }

//   static bool clearAddressFromSharedPref() {
//     SharedPreferences sharedPreferences = Get.find<SharedPreferences>();
//     sharedPreferences.remove(AppConstants.userAddress);
//     return true;
//   }

// }