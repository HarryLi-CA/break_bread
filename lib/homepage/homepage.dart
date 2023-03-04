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
  final int cost;
  final String due;
  final String link1;
  final String link2;
  final String link3;
  final String link4;

  Info(
      {required this.resturant,
      required this.cost,
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
    List<Info> bills = List.empty(growable: true);
    bills.add(Info(
      resturant: 'Dim Sum',
      cost: 1475,
      due: 'March 7th',
      link1:
          'https://media.istockphoto.com/id/1300512215/photo/headshot-portrait-of-smiling-ethnic-businessman-in-office.jpg?b=1&s=170667a&w=0&k=20&c=TXCiY7rYEvIBd6ibj2bE-VbJu0rRGy3MlHwxt2LHt9w=',
      link2:
          'https://www.shutterstock.com/image-photo/profile-picture-smiling-millennial-asian-260nw-1836020740.jpg',
      link3:
          'https://media.istockphoto.com/id/174818443/photo/pensive-teenager.jpg?s=612x612&w=0&k=20&c=inTDBpnylnBKkN6AthkzEiYT4kEUzDPQLupQG2_83zA=',
      link4:
          'https://t4.ftcdn.net/jpg/04/44/53/99/360_F_444539901_2GSnvmTX14LELJ6edPudUsarbcytOEgj.jpg',
    ));
    bills.add(Info(
      resturant: 'Dim Sum',
      cost: 475,
      due: 'March 7th',
      link1:
          'https://media.istockphoto.com/id/1300512215/photo/headshot-portrait-of-smiling-ethnic-businessman-in-office.jpg?b=1&s=170667a&w=0&k=20&c=TXCiY7rYEvIBd6ibj2bE-VbJu0rRGy3MlHwxt2LHt9w=',
      link2:
          'https://www.shutterstock.com/image-photo/profile-picture-smiling-millennial-asian-260nw-1836020740.jpg',
      link3:
          'https://media.istockphoto.com/id/174818443/photo/pensive-teenager.jpg?s=612x612&w=0&k=20&c=inTDBpnylnBKkN6AthkzEiYT4kEUzDPQLupQG2_83zA=',
      link4:
          'https://t4.ftcdn.net/jpg/04/44/53/99/360_F_444539901_2GSnvmTX14LELJ6edPudUsarbcytOEgj.jpg',
    ));
    bills.add(Info(
      resturant: 'Dim Sum',
      cost: 475,
      due: 'March 7th',
      link1:
          'https://media.istockphoto.com/id/1300512215/photo/headshot-portrait-of-smiling-ethnic-businessman-in-office.jpg?b=1&s=170667a&w=0&k=20&c=TXCiY7rYEvIBd6ibj2bE-VbJu0rRGy3MlHwxt2LHt9w=',
      link2:
          'https://www.shutterstock.com/image-photo/profile-picture-smiling-millennial-asian-260nw-1836020740.jpg',
      link3:
          'https://media.istockphoto.com/id/174818443/photo/pensive-teenager.jpg?s=612x612&w=0&k=20&c=inTDBpnylnBKkN6AthkzEiYT4kEUzDPQLupQG2_83zA=',
      link4:
          'https://t4.ftcdn.net/jpg/04/44/53/99/360_F_444539901_2GSnvmTX14LELJ6edPudUsarbcytOEgj.jpg',
    ));
    bills.add(Info(
      resturant: 'Dim Sum',
      cost: 475,
      due: 'March 7th',
      link1:
          'https://media.istockphoto.com/id/1300512215/photo/headshot-portrait-of-smiling-ethnic-businessman-in-office.jpg?b=1&s=170667a&w=0&k=20&c=TXCiY7rYEvIBd6ibj2bE-VbJu0rRGy3MlHwxt2LHt9w=',
      link2:
          'https://www.shutterstock.com/image-photo/profile-picture-smiling-millennial-asian-260nw-1836020740.jpg',
      link3:
          'https://media.istockphoto.com/id/174818443/photo/pensive-teenager.jpg?s=612x612&w=0&k=20&c=inTDBpnylnBKkN6AthkzEiYT4kEUzDPQLupQG2_83zA=',
      link4:
          'https://t4.ftcdn.net/jpg/04/44/53/99/360_F_444539901_2GSnvmTX14LELJ6edPudUsarbcytOEgj.jpg',
    ));
    bills.add(Info(
      resturant: 'Dim Sum',
      cost: 475,
      due: 'March 7th',
      link1:
          'https://media.istockphoto.com/id/1300512215/photo/headshot-portrait-of-smiling-ethnic-businessman-in-office.jpg?b=1&s=170667a&w=0&k=20&c=TXCiY7rYEvIBd6ibj2bE-VbJu0rRGy3MlHwxt2LHt9w=',
      link2:
          'https://www.shutterstock.com/image-photo/profile-picture-smiling-millennial-asian-260nw-1836020740.jpg',
      link3:
          'https://media.istockphoto.com/id/174818443/photo/pensive-teenager.jpg?s=612x612&w=0&k=20&c=inTDBpnylnBKkN6AthkzEiYT4kEUzDPQLupQG2_83zA=',
      link4:
          'https://t4.ftcdn.net/jpg/04/44/53/99/360_F_444539901_2GSnvmTX14LELJ6edPudUsarbcytOEgj.jpg',
    ));
    int total = 0;
    for (int i = 0; i < bills.length; i++) {
      total += bills.elementAt(i).cost;
    }
    //ADD MATH FUNCTION TO SUM UP BILL TOTALS

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 162, 96, 20),
        toolbarHeight: MediaQuery.of(context).size.height / 5,
        actions: const [
          Padding(
            padding: EdgeInsets.all(20),
            child: Icon(
              Icons.person_2_outlined,
            ),
          )
        ],
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          /** 
          const Text(
            'LOGO',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          */
          //everything under text replaced by:
          Positioned(
            child: Image.asset(
              'assets/images/bbreadpng.png',
              //Users/sherrylin/break_bread/assets/images/bbread.png
              height: 120,
              width: 120,
              scale: 1.0,
            ),
          ),

          Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                Text(
                  'Breaking Bread',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 235, 214, 191)),
                ),
                SizedBox(height: 10),
                Text(
                  ('Total: \$' +
                      ((total ~/ 100).toString()) +
                      "." +
                      ((total % 100).toString())),
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                ),
              ])),
        ]),

        //Container(),
        //NEED TO ADD TOTAL BALANCE BELOW
        // Text('Total balance: '+ total.toString()),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(200, 56.0),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(0),
        width: double.maxFinite,
        child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            itemCount: bills.length,
            separatorBuilder: ((context, index) {
              return const Divider(
                indent: 10,
                endIndent: 10,
              );
            }),
            itemBuilder: (context, index) {
              return postComponent(bills.elementAt(index));
            }),
      ),
      backgroundColor: Color.fromARGB(255, 228, 194, 155),
    );
  }

  postComponent(Info info) {
    return InkWell(
      child: Container(
        height: 220,
        padding: const EdgeInsets.all(14),
        margin: const EdgeInsets.only(bottom: 18),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 162, 96, 20),
            boxShadow: [
              BoxShadow(
                color: Colors.brown.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ]),
        child: Stack(
          children: [
            Row(
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
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                      SizedBox(height: 22),
                      //+ "." + (info.total%100).toString()
                      Text(
                        "Cost: \$" +
                            (info.cost ~/ 100).toString() +
                            "." +
                            (info.cost % 100).toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                      Text(
                        "/person",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 13),
                      ),
                      SizedBox(height: 22),
                      Text(
                        "Due: " + info.due,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 13),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      const SizedBox(width: 7),
                      const Text(
                        'Shared With',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 17),
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
                            backgroundImage: NetworkImage(
                              info.link2,
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
                            backgroundImage: NetworkImage(
                              info.link3,
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                          SizedBox(width: 15),
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                              info.link4,
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
            Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 69, 44, 25),
                    radius: 13,
                    child: Icon(Icons.close),
                  ),
                  //Icon(Icons.close_outlined),
                  onTap: () {
                    //delete posts function
                  },
                )),
          ],
        ),
      ),
    );
  }
}
