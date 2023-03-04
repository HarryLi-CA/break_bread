import 'package:break_bread/bill.dart';
import 'package:break_bread/models/userData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String? userEmail;
  
  DatabaseService({this.userEmail});
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('Users');
  final CollectionReference billCollection = FirebaseFirestore.instance.collection('Bills');

  Future setUser(UserData userData) async {
    DocumentSnapshot<Object?> docRef = await usersCollection.doc(userData.email).get();
    if(docRef.exists){
      return usersCollection.doc(userData.email).update(
        {
        "email": userData.email,
        "name": userData.name,
        "profilePicURL": userData.profilePicURL,
        }
      );
    }
    return await usersCollection.doc(userData.email).set(userData.toJson());
  }

  Future addBill(Bill bill, List<String> users) async {
    DocumentReference currentBill = billCollection.doc();
    
    for (String email in bill.emails) {
      await billCollection.doc(email).update({
      "billsID": FieldValue.arrayUnion([billCollection.id])
    });
    }
    return await currentBill.set(bill.toJson());;
  }

  Future removeBill(String billId)async{
    dynamic data = (await billCollection.doc(billId).get()).data();
    Bill bill = Bill.fromJson(data); //TODO make it check each user to see if the transaction finished
    if(bill.emails.isEmpty){
      await billCollection.doc(billId).delete();
    }
    return await usersCollection.doc(userEmail).update({
      "billsID": FieldValue.arrayRemove([billId])
    });
  }

  Future<Bill> getBillInfo(String billId)async{
    dynamic data = (await billCollection.doc(billId).get()).data();
    Bill bill = Bill.fromJson(data);
    return bill;
  }

  Future<UserData> getUserData(String email) async{
    dynamic data = (await billCollection.doc(email).get()).data();
    UserData userData = UserData.fromJson(data);
    return userData;
  }
}