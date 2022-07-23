import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lowbill/models/user.dart';


class FbUserController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 
  Future<bool> create (User user, String name, String phone , String city) async{
 return _firestore.collection('Users').add({
    'id':user.uid, 
    'name' :name,
    'email':user.email,
    'phone':phone,
    'city':city
 }).then((value) => true)
 .catchError((error)=> false);
  }
  
 
  // Future<UserData> getUserFromFirestore(String userId) async {
  //   DocumentSnapshot<Map<String, dynamic>> document =
  //       await _firestore.collection('Users').doc(userId).get();
  //   Map<String, dynamic>? map = document.data();
  //   UserData userModel = UserData.fromMap(map!);
  //   print(userModel.toMap());
  //   return userModel;
  // }


 

  Future<bool> update({required UserData user}) {
    return _firestore
        .collection('Users')
        .doc(user.id)
        .update(user.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }
}