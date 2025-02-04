import 'package:data_app/screen/home.dart';
import 'package:flutter/material.dart';

void main () {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
