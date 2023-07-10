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

  Future <double> GetLatitude() async{
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.latitude); //Exemple output: 29.6593457
    double d_latitude = await position.longitude;
    double.parse((d_latitude).toStringAsFixed(4));
    return position.latitude;
  }

  Future <double> GetLongitude() async{
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude);
    double d_longitude = await position.longitude;
    double.parse((d_longitude).toStringAsFixed(4));
    return d_longitude;
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  //Fonction pour calculer le local sidereal time nécessaire pour l'appel API qui reproduira la carte
  Future <double> GetLST() async{

    //on calcule le nombre de jour depuis l'an 2000
    final birthday = DateTime(2000, 01, 01);
    final date2 = DateTime.now();
    final difference = daysBetween(birthday, date2);
    int heures = DateTime.now().toUtc().hour;
    print('Date :'+ DateTime.now().toString());
    double long = await GetLongitude();
    //formule pour calculer le local sidereal time
    //LST = 100.46 + 0.985647 * d + long + 15*UT
    double LST = (100.4606184+0.9856473662862*difference+15*heures)/1000;
    //print('LST:'+LST.toString());
    return LST;
  }
}
