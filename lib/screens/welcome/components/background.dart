import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key, required Column child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          
           Positioned(
            child: Image.asset(
              'assets/images/bbreadpng.png'
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Text("LOGIN"),
            ),
          ),
        ],
      ),
    );
  }
}
