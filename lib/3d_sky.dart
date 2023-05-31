import 'package:flutter/material.dart';
import 'api_call.dart';

class SkyMap extends StatelessWidget {

  ApiCarte callapi = ApiCarte();
  String urlSkyMap = '';
  @override
  Future<void> SetSkyMap () async {
    urlSkyMap = urlSkyMap = await callapi.makePostRequest();
    print('urlSkyMap '+ urlSkyMap);
  }
  Widget build(BuildContext context) {
    SetSkyMap();
    var title = 'Sky Map';
    return MaterialApp(
      title: title,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Image.network('https://widgets.astronomyapi.com/star-chart/generated/a2e1807e3e4a95eab11fcda5043e004e34b0838ec421dbaa73a13b35789cc9d7.png'),
      ),
    );
  }
}