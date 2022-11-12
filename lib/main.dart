import 'package:flutter/material.dart';
import 'package:flutter_restapi/Homepage.dart';
//import 'package:flutter_restapi/Homepage.dart';
import 'package:flutter_restapi/Photo/ui_part.dart';
import 'package:flutter_restapi/Postapi/Postapi.dart';
import 'package:http/http.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostApi(),
    );
  }
}
