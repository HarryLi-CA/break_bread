import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:break_bread/homepage/homepage.dart';
import 'package:break_bread/home.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 15,
      child: new Scaffold(
        body: TabBarView(
          children: [
            new HomePage(),
          ],
        ),
        backgroundColor: Colors.brown,
      ),
    );
  }
}
              //person search add photos rounded account circle