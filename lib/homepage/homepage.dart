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

  Info({required this.resturant, required this.total, required this.due});
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //object
    Info info =
        Info(resturant: 'Dim Sum', total: 453, due: 'March 7th');

    int total = 500; //ADD MATH FUNCTION TO SUM UP BILL TOTALS

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.food_bank), //temp icon need to change
        title: Text('Breaking Bread', style: TextStyle(fontSize: 20)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        flexibleSpace: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22), color: Colors.brown),
        child: Text(
          '${total}',
          style: TextStyle(color: Colors.black),
        ),
      ),
    ),

      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.maxFinite,
        child: ListView.separated(
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
      backgroundColor: Colors.brown.shade50,
    );
  }

  postComponent(Info info) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.brown.shade400,
            boxShadow: [
              BoxShadow(
                color: Colors.brown.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ]),
        
        child: 
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: <Widget>[
            

            //Icon, Name, Username
            //new
            
            Container(
              padding: const EdgeInsets.all(10),
             margin: const EdgeInsets.only(bottom: 20),
             color: Color.fromARGB(255, 203, 157, 140),
              child: Column(
              
                children: [
                  //info on left hand side
                  //resturant, cost, date
                   /** */
            
                  Text(
                      info.resturant,
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                  SizedBox(height: 15),
                  Text(
                    'Cost: '+
                      info.total.toString(),
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                    ),
                  SizedBox(height: 15),
                   Text(
                      info.due,
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                    ),
                  //Placeholder(),
                  
                ],
                
              ),
            ),
            

            //shared with friend list
            SizedBox(width: 15),

            Column(
              children: [
                Text('Shared With', 
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),
                //shared list
                SizedBox(height: 10),
                Row(

                  children: [

                    Icon(Icons.person_2_outlined),
                    SizedBox(width: 15),
                    Icon(Icons.person_2_outlined),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.person_2_outlined),
                    SizedBox(width: 15),
                    Icon(Icons.person_2_outlined),
                  ],
                ),

              ],
            ),
            
          ],
        ),
        
      ),
    );
  }
}
