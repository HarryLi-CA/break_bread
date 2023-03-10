
import 'package:break_bread/homepage/homepage.dart';
import 'package:break_bread/screens/welcome/login_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}
const isMac = false;

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          primaryColor: Colors.amberAccent,
        ),
          home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, snapshot) {
            if(snapshot.hasData|| isMac){
              return HomePage(snapshot.data!.email!);
            }
            return LoginScreen();
          }
        ),
      );
  }
}