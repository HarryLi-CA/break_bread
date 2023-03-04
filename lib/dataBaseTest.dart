import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final databaseRef = FirebaseFirestore.instance.collection('Users').withConverter(
  fromFirestore: (snapshots, options) => Transaction.fromJson(snapshots.data()!),
  toFirestore: (transaction, _) => transaction.toJson(),
);
class DataBaseTest extends StatefulWidget {
  const DataBaseTest({super.key});

  @override
  State<DataBaseTest> createState() => _DataBaseTestState();
}

class _DataBaseTestState extends State<DataBaseTest> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Users').doc('kaMPnaQBJnTsf8d0xqCL').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text("Loading");
        }
        var userDocument = snapshot.data;
        return  Text(userDocument!["FN"]);
      }
  );
  }
}

class Transaction {
  Transaction({required this.restaurant, required this.data,});
  String restaurant;
  int data;
  Transaction.fromJson(Map<String, Object?> json):this(
    restaurant: (json['restaurant']! as String),
    data: (json['data']! as int),
  );
  Map<String, Object?> toJson(){
    return{
      "restaurant": restaurant,
      "data": data,
    };
  }
}