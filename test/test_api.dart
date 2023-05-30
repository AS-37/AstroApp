import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:astroapp/main.dart';
import 'package:http/http.dart';
import 'package:geolocator/geolocator.dart';

Future<bool> main () async {

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
    if(response.statusCode != 200){
      print('API call not working code:'+response.statusCode.toString());
      return false;
    }
    else {
      return true;
    }
}