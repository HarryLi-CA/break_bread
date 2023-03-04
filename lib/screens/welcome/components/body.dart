// ignore: unused_import
import 'dart:io';

import 'package:break_bread/services/auth.dart';
import 'package:flutter/material.dart';

import 'background.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AuthService _auth = AuthService();
  bool loading = false;
  
  String error = "";

  @override
  Widget build(BuildContext context) {
    var child;
    return Scaffold(
      // ignore: prefer_typing_uninitialized_variables
      backgroundColor: const Color.fromARGB(255, 235, 214, 191),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text(
                'Welcome to BreakingBread!',
                
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20)
              ),
              const Text(
                'Login to Break Bread.',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 35),
              Positioned(
                    child: Image.asset('assets/images/bbreadpng.png'),
                  ),
              //LOGO HERE or above the welcome?
              //Image(image: image)
              /*
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding: const EdgeInsets.only(left: 20.0),
                  child: const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'email address'),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'password',
                      ),
                    )),
              ),
              */
              const SizedBox(height: 25),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(180),
                  backgroundColor: const Color.fromARGB(255, 162, 96, 20),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                    side: const BorderSide(color: Color.fromARGB(0, 238, 153, 64)),
                  ),
                ),
                
                onPressed: () async {
                    setState(()=> loading = true);
                    dynamic result = await _auth.signInGoogle();
                    if (result == null){
                        error = 'Please Supply Valid Email';
                        loading = false;
                    }
                  },
                child: const Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );

    /*return const Background(

      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Welcome to Breaking Bread!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ],
      ),*/
  }
}


/*const Text(
            "Welcome to BreakingBread",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          */
