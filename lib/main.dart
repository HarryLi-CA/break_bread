import 'package:break_bread/constants.dart';
import 'package:break_bread/screens/welcome/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BreakingBread',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: const Color.fromRGBO(248, 204, 153, 1),
      ),
      home: LoginScreen(),

        );
    
  }
}
