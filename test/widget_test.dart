// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:astroapp/main.dart';
import 'package:http/http.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  testWidgets('Tests Permissions et geolocalisation', (WidgetTester tester) async {

    //TESTS PERMISSIONS ET GEOLOCALISATION
    print('TESTS PERMISSIONS ET GEOLOCALISATION');

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

    Position positionlat = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(positionlat.longitude);
    double d_longitude = await positionlat.longitude;

    Position positionlong = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(positionlat.latitude); //Exemple output: 29.6593457
    double d_latitude = await positionlong.longitude;

  });
}
