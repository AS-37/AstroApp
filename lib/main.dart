import 'package:flutter/material.dart';
import 'home_page.dart';
import 'api_call.dart';
void main() {
  runApp(MyApp());
  //ApiCarte callapi = new ApiCarte();
  //callapi.makePostRequest();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AstroApp',
      theme: ThemeData( primaryColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

