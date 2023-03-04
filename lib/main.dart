import 'package:break_bread/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:break_bread/home.dart';
import 'package:break_bread/wrapper.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Home()

    );
  }
}