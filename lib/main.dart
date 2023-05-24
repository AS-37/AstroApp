import 'package:flutter/material.dart';
import 'home_page.dart';
import 'api_call.dart';
void main() {
  runApp(MyApp());
  ApiCarte callapi = new ApiCarte();
  callapi.makePostRequest();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}