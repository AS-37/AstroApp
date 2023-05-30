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
  testWidgets('TESTS', (WidgetTester tester) async {
    /*
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
    */
    //TESTS API ET BASIC AUTH
    print('TESTS API ET BASIC AUTH');
    String username = '9a596bfe-ceb4-42e4-a64f-c03be692c8f8';
    String password = '318c4b8de827bb169c8c95169bf8228bf2892b30d3222417becaed1f195443dc5d6d3c3ed4337270f0907ed6c748fd13daef17a1f75b91d8ca1616bd38b371cdf854427757936e32cec5a92e7b2d652ded7684c761763d119c6f9cdb6b77050ee20208ad6ee9e914b83860c6417d4e71';
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    print(basicAuth);
    final url = Uri.parse('https://api.astronomyapi.com/api/v2/studio/star-chart');
    final headers = {"Content-type": "application/json"};
    //declination = observer's latitude et right ascension = local sidereal time
    final json = {
      "observer": {
        "latitude": 50.63341,
        "longitude": 3.02004,
        "date": "2023-05-24"
      },
      "view": {
        "type": "area",
        "parameters": {
          "position": {
            "equatorial": {
              "rightAscension": 10.1821,
              "declination": 50.63341
            }
          },
          "zoom": 2 //optional
        }
      }
    };

    final response = await post(url, headers: <String, String>{'authorization': basicAuth}, body: JsonEncoder().convert(json));
    print('Status code: ${response.statusCode}');
    expect(response.statusCode, 200);
    if(response.statusCode != 200) print('API call not working code:'+response.statusCode.toString());

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
