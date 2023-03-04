//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:break_bread/homepage/info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class Info {
  final String resturant;
  final int total;
  final String due;
  final String link1;
  final String link2;
  final String link3;
  final String link4;

  Info(
      {required this.resturant,
      required this.total,
      required this.due,
      required this.link1,
      required this.link2,
      required this.link3,
      required this.link4});
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //object
    Info info = Info(
      resturant: 'Dim Sum',
      total: 453,
      due: 'March 7th',
      link1:
          'https://media.istockphoto.com/id/1300512215/photo/headshot-portrait-of-smiling-ethnic-businessman-in-office.jpg?b=1&s=170667a&w=0&k=20&c=TXCiY7rYEvIBd6ibj2bE-VbJu0rRGy3MlHwxt2LHt9w=',
      link2:
          'https://www.shutterstock.com/image-photo/profile-picture-smiling-millennial-asian-260nw-1836020740.jpg',
      link3:
          'https://media.istockphoto.com/id/174818443/photo/pensive-teenager.jpg?s=612x612&w=0&k=20&c=inTDBpnylnBKkN6AthkzEiYT4kEUzDPQLupQG2_83zA=',
      link4:
          'https://t4.ftcdn.net/jpg/04/44/53/99/360_F_444539901_2GSnvmTX14LELJ6edPudUsarbcytOEgj.jpg',
    );

    int total = 500; //ADD MATH FUNCTION TO SUM UP BILL TOTALS

    return Scaffold(
      appBar: 
      AppBar(
      
      backgroundColor: Color.fromARGB(255, 162, 96, 20),
      toolbarHeight:MediaQuery.of(context).size.height/5,
      title: Text('Break Bread', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
      //Container(),
      //NEED TO ADD TOTAL BALANCE BELOW 
      // Text('Total balance: '+ total.toString()),
      shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.vertical(
      bottom: new Radius.elliptical(200, 56.0),
      ),
      
    ),
    


  ),
      body: Container(
        padding: const EdgeInsets.all(0),
        width: double.maxFinite,
        child: ListView.separated(
          shrinkWrap: true,

            padding: const EdgeInsets.all(20),
            itemCount: 5,
            separatorBuilder: ((context, index) {
              return const Divider(
                indent: 10,
                endIndent: 10,
              );
            }),
            itemBuilder: (context, index) {
              return postComponent(info);
            }),
      ),
      backgroundColor: Color.fromARGB(255, 228, 194, 155),

      
    );
  }

  postComponent(Info info) {
    return InkWell(
      child: Container(
        
        height:220,
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.only(bottom: 18),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 147, 102, 75),
            boxShadow: [
              BoxShadow(
                color: Colors.brown.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ]),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //Icon, Name, Username
            //new

            Container(
              height: 220,
              padding: const EdgeInsets.all(32),
              //margin: const EdgeInsets.only(bottom: 10),
              //color: Color.fromARGB(255, 205, 181, 163),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 235, 214, 191),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ]),

              child: Column(
                children: [
                  //info on left hand side
                  //resturant, cost, date
                  /** */

                  Text(
                    info.resturant,
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  SizedBox(height: 22),
                 //+ "." + (info.total%100).toString() 
                  Text(
                    "Cost: " + (info.total~/100).toString() + "." + (info.total%100).toString() ,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                  Text(
                    "/person" ,
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                  ),
                  SizedBox(height: 22),
                  Text(
                    "Due: "+ info.due,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                  ),
                ],
              ),
            ),


            //shared with friend list
            const SizedBox(width: 15),

            Container(
              height: 220,
              padding: const EdgeInsets.all(11),
              margin: const EdgeInsets.only(bottom: 0),
              //color: Color.fromARGB(255, 205, 181, 163),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 235, 214, 191),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ]),

              child: Column(
                
              //crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                

                children: [
                  const SizedBox(width: 7),
                  const Text(
                    'Shared With',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                  ),
                  //shared list
                  const SizedBox(height: 14),
                  Row(
                    children: [

                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(info.link1),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(width: 15),
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(info.link2,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(info.link3,
                        ),
                        backgroundColor: Colors.transparent,
                        ),
            
                      
                      SizedBox(width: 15),
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(info.link4,
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
