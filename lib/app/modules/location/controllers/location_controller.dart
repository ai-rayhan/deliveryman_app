import 'package:deliveryman_app/app/data/preferences_key.dart';
import 'package:deliveryman_app/app/modules/location/domain/response/ip_response.dart';
import 'package:deliveryman_app/app/modules/location/domain/services/location_service.dart';
import 'package:deliveryman_app/core/api_response.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationController extends GetxController {
  LatLng currentLocation = LatLng(37.10, 122.35);
  final markers = <Marker>{};
  String address = '';
  String city='';
  String zip='';
  String country='';
  bool isLoading = true;

  Future<void> checkLocationPermission() async {
    isLoading = true;
    update();
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Permission Denied', 'Location permissions are denied');
        isLoading = false;
        update();
        return;
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Permission Denied', 'Location permissions are permanently denied');
      isLoading = false;
      update();
      return;
    }

    if (permission == LocationPermission.whileInUse||permission == LocationPermission.always) {
      getCurrentLocation();
    }
    // getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      LatLng latLng = LatLng(position.latitude, position.longitude);
      onMapTap(latLng); // Update marker and location
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  void onMapTap(LatLng position) {
    markers.clear();
    markers.add(Marker(
      markerId: const MarkerId('selected_location'),
      position: position,
      onTap: () {
        getAddressFromLatLng(position);
      },
    ));
    currentLocation = position;
    isLoading = false;
    update();

    getAddressFromLatLng(position);
  }

  Future<void> getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        address = '${place.street}, ${place.locality}, ${place.country}';
        city=place.locality??"";
        zip=place.postalCode??"";
        country=place.country??"";
        savelocationInPrefs();
        }
    } catch (e) {
      print('Error getting address: $e');
      address = 'Address not found';
    }

    update();
  }

  savelocationInPrefs()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setDouble('lat', currentLocation.latitude);
    await sharedPreferences.setDouble('lng', currentLocation.longitude);
    await sharedPreferences.setString(PrefsKey.address, address);
    await sharedPreferences.setString(PrefsKey.zip, zip);
    await sharedPreferences.setString(PrefsKey.city, city);
    await sharedPreferences.setString(PrefsKey.country, country);
  }

  getlocationFromPrefs()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    currentLocation = LatLng(sharedPreferences.getDouble('lat')??23.8041, sharedPreferences.getDouble('lng')??90.4152);
    address = sharedPreferences.getString(PrefsKey.address)??'';
    city=sharedPreferences.getString(PrefsKey.city)??'';
    zip=sharedPreferences.getString(PrefsKey.zip)??'';
    country=sharedPreferences.getString(PrefsKey.country)??'';
    update();
  }
  LocationService locationService = LocationService();
  getuserLocationFromIp()async{
    final ApiResponse<IpInfoResponse> response=await locationService.getIpInfo();
    if(response.isSuccess){
      onMapTap(LatLng(response.data!.location.latitude, response.data!.location.longitude));
    }
    update();
  }
 clearPrefsLocation()async{
  SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
  sharedPreferences.remove('lat');
  sharedPreferences.remove('lng');
  update();
 }
  @override
  void onInit() {
    getlocationFromPrefs();
    // getuserLocationFromIp();
    super.onInit();
  }
}
