import 'package:cloud_firestore/cloud_firestore.dart';
class DataBaseService{
  final String uid;

  DataBaseService ({ this.uid });

  final CollectionReference itemCollection = Firestore.instance.collection('kupnje');

  Future updateUserData(String name, double price) async{
    return await itemCollection.document(uid).setData({
      'name': name,
      'price': price,
    });
  }

}