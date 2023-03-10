//import 'dart:js';

import 'package:break_bread/bill.dart';
import 'package:break_bread/models/userData.dart';
import 'package:break_bread/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:break_bread/homepage/info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/databaseService.dart';

class HomePage extends StatefulWidget {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late DatabaseService dbService;
  
  String userEmail;
   HomePage(this.userEmail){
    dbService = DatabaseService(userEmail: userEmail);
  }

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
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    //ADD MATH FUNCTION TO SUM UP BILL TOTALS

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 162, 96, 20),
        toolbarHeight: MediaQuery.of(context).size.height / 5,
        actions:  [
          Padding(
            padding: EdgeInsets.only(right:20),
            child: Expanded(
              child: IconButton(
                tooltip: "Access Your Profile!",
                iconSize: 40,
                icon: Center(
                  child: Icon(
                    Icons.person_2_outlined,
                  ),
                ),
                onPressed: (){}, 
              ),
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
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Users').doc(widget.userEmail).snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text("Loading");
            }
            UserData userData = UserData.fromJson(snapshot.data!.data()!);
            return  ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              itemCount: userData.billsID.length,
              separatorBuilder: ((context, index) {
                return const Divider(
                  indent: 10,
                  endIndent: 10,
                );
              }),
              itemBuilder: (context, index) {
                return StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('Bills').doc(userData.billsID.elementAt(index)).snapshots(),
                  builder: (context, snapshot){
                      if (!snapshot.hasData) {
                        return Text("Loading");
                      }
                    Bill bill = Bill.fromJson(snapshot.data!.data()!);
                    List<Widget> images = List.empty(growable: true);
                    for (int i = 0; i < 4; i++) {
                      if(i >= bill.emails.length){
                        images.add(CircleAvatar(
                              radius: 30.0,
                              backgroundColor: Colors.transparent,
                            )
                          );
                      }
                      else{
                      images.add(
                        StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('Users').doc(bill.emails.elementAt(i)).snapshots(),
                          builder: (context, snapshot){
                                if (!snapshot.hasData) {
                                  return Text("Loading");
                                }
                            UserData billUserData = UserData.fromJson(snapshot.data!.data()!);
                            return CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage(
                                billUserData.profilePicURL,
                              ),
                              backgroundColor: Colors.transparent,
                            );
                          }
                        )
                      );
                      }
                    }
                    return postComponent(bill, index, images, userData.billsID.elementAt(index));
                }); 
              }
            );
          },
        ),
      ),
      backgroundColor: Color.fromARGB(255, 228, 194, 155),
    );
  }

  postComponent(Bill bill, int index, List<Widget> images, String billID) {
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
                        bill.restaurant,
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                      SizedBox(height: 22),
                      //+ "." + (info.total%100).toString()
                      Text(
                        "Cost: \$" +
                            (bill.cost ~/ 100).toString() +
                            "." +
                            (bill.cost % 100).toString(),
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
                        "Due: " + bill.dueDate,
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
                          images.elementAt(0),
                          SizedBox(width: 15),
                          images.elementAt(1),
                        ],
                      ),

                      SizedBox(height: 10),

                      Row(
                        children: [
                          images.elementAt(2),
                          SizedBox(width: 15),
                          images.elementAt(3),
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
                    child: Icon(Icons.check),
                  ),
                  //Icon(Icons.close_outlined),
                  onTap: ()async{
                    //delete posts function
                    widget.dbService.removeBill(billID);
                  },
                )),
          ],
        ),
      ),
    );
  }
}
