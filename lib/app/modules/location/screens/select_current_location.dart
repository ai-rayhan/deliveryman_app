import 'dart:developer';
import 'package:deliveryman_app/app/routes/app_routes.dart';
import 'package:deliveryman_app/helper/translated_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/location_controller.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});
  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  GoogleMapController? _mapController;
  bool isReset=Get.arguments??false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // getUserLocationOnStart();
    });
  }

  void getUserLocationOnStart() async {
    final locationController = Get.find<LocationController>();
    if(locationController.address.isNotEmpty && !isReset){
      Get.offAndToNamed(Routes.bottomNavigationBar);
    }else{
      await locationController.checkLocationPermission();
      if (locationController.address.isNotEmpty) {
        log("message: ${locationController.currentLocation}");
        Get.offAndToNamed(Routes.bottomNavigationBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final locationController = Get.find<LocationController>();
    return Scaffold(
      body: GetBuilder<LocationController>(builder: (controller) {
        // if (controller.isLoading) {
        //   return const Center(child: CircularProgressIndicator());
        // }
        return SafeArea(
          child: Stack(
            children: [
              GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: controller.currentLocation,
                      zoom: 14.0,
                    ),
                    onMapCreated: (GoogleMapController mapController) {
                      _mapController = mapController;
                        if (_mapController != null) {
                       _mapController!.animateCamera(CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: controller.currentLocation,
                            zoom: 18.0, // Zoom in when current location is found
                          ),
                        ));
                      }  
                    },
                    onTap: controller.onMapTap, // Tap on the map to place marker
                    markers: controller.markers,
                
                  ),
              // Show location name
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).highlightColor,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),)
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10)
                    ),
                  ),
                  child: Center(
                    child: Text(
                          controller.address,
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                ),
              ),
            
            ],
          ),
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 5, right: 5, left: 5),
        child: ElevatedButton(onPressed: (){
          locationController.savelocationInPrefs();
          Get.toNamed(Routes.bottomNavigationBar);
        }, child:  Text('save_location'.translate)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton:  Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: IconButton(
                icon:  Icon(Icons.my_location,color: Theme.of(context).primaryColor,),
                onPressed: () async {
                  await locationController.checkLocationPermission();
                  log(locationController.currentLocation.toString());
        
                  if (_mapController != null) {
                    _mapController!.animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: locationController.currentLocation,
                        zoom: 18.0, // Zoom in when current location is found
                      ),
                    ));
                  }
                },
              ),
      ),
    );
  }
}
