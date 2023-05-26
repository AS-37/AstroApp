import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class locationPage {

  Future <bool> isGPSEnabled() async{

    bool servicestatus = await Geolocator.isLocationServiceEnabled();
    if(servicestatus){
      print("GPS service is enabled");
      return true;
    }
    else{
      print("GPS service is disabled.");
      return false;
    }
  }

  Future <void> isLocationPEnabled() async{
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
      }else if(permission == LocationPermission.deniedForever){
        print("'Location permissions are permanently denied");
      }else{
        print("GPS Location service is granted");
      }
    }else{
      print("GPS Location permission granted.");
    }
  }

  Future <String> GetLatitude() async{
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.latitude); //Output: 29.6593457

    return position.latitude.toString();
  }

  Future <String> GetLongitude() async{
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 29.6593457

    return position.longitude.toString();
  }
}
