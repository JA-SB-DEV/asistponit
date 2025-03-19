import 'package:asispoint/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationService {
  Location location = Location();
  late LocationData _locdata;

  Future<Map<String, double?>?> initializaAndGetLocation(
      BuildContext context) async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    //Location
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        Utils.showSnackBar("Por favor permita la ubicación", context);
        return null;
      }
    }
    // service
    permissionGranted = await location.hasPermission();

    if(permissionGranted == PermissionStatus.denied){
      permissionGranted = await location.requestPermission();
      if(permissionGranted != PermissionStatus.granted ){
        Utils.showSnackBar("Por favor ", context);
        return null;
      }
    }
    _locdata = await location.getLocation();
    return{
      'Latitud':_locdata.latitude,
      'longitud':_locdata.longitude,
    };
  }
}
