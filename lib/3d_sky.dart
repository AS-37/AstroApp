import 'package:flutter/material.dart';
import 'api_call.dart';

class SkyMap extends StatelessWidget {
/*
  ApiCarte callapi = ApiCarte();
  String urlSkyMap = '';
  String urlMoon = '';

  @override
  Future<void> SetSkyMap () async {
    urlSkyMap = urlSkyMap = await callapi.makePostRequestSky();
    urlMoon = await callapi.makePostRequestMoon();
    print('urlSkyMap '+ urlSkyMap);
    print('urlMoon '+ urlMoon);
  }

 */
  @override
  Widget build(BuildContext context) {
    var title = 'SKY MAP';
    return MaterialApp(
      title: title,
      theme: ThemeData(primaryColor: Colors.black),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.black,
        ),
          body: Image.network('https://widgets.astronomyapi.com/star-chart/generated/a2e1807e3e4a95eab11fcda5043e004e34b0838ec421dbaa73a13b35789cc9d7.png')
      ),
    );
  }
}