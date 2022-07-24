import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lowbill/controllers/fb_auth_controller.dart';
import 'package:lowbill/models/user.dart';


class FbUserController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 
  Future<bool> create (User user, String name, String phone , String city) async{
 return _firestore.collection('Users').doc(user.uid).set({
    'id':user.uid, 
    'name' :name,
    'email':user.email,
    'phone':phone,
    'city':city
 }).then((value) => true)
 .catchError((error)=> false);
  }
  
 
  

  Future<bool> update({required UserData user}) {
    return _firestore
        .collection('Users')
        .doc(user.id)
        .update(user.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

 Stream<QuerySnapshot<UserData>> read () async* { 
 yield* _firestore.collection('Users').where('id' , isEqualTo: FbAuthController().currentUserId).withConverter<UserData>(fromFirestore: (snapshot, options) => UserData.fromMap(snapshot.data()!), toFirestore: (userdata , options)=>userdata.toMap()). snapshots();

 } 
}