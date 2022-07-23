import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lowbill/Helpers/helpers.dart';

import 'fb_user_controller.dart';
import 'dart:async';

typedef FbAuthStateListener = void Function({ required bool status});
class FbAuthController with Helpers{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
   Future<bool> signIn(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        return true;
      //  if (userCredential.user!.emailVerified) {
      //     return true;
      //   } 
      //   else {
      //     await userCredential.user!.sendEmailVerification();
      //     await signOut();
      //     showSnackBar(
      //         context: context,
      //         message: 'Email must be verified, check and try again!',
      //         error: true);
      //   }
      }
    } on FirebaseAuthException catch (e) {
      _controlAuthException(context: context, exception: e);
    } catch (e) {
      print(e);
    }

    return false;
  }

  Future<bool> createAccount(
      {required BuildContext context,
      required String email,
      required String name,
      required String phone,
      required String city,
      required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);


      //await userCredential.user?.sendEmailVerification();
     // await userCredential.user?.updateDisplayName(name);
      await FbUserController().create(userCredential.user!, name,phone, city  );

      await signOut();
      showSnackBar(
          context: context,
          message: 'Account created');
      return true;
    } on FirebaseAuthException catch (e) {
      _controlAuthException(context: context, exception: e);
    } catch (e) {
      print(e);
    }
    return false;
  }
 Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
StreamSubscription checkUserState({required FbAuthStateListener listener}) {
 return  _firebaseAuth.authStateChanges().listen((User? user) {
   listener(status:  user!= null);
 });
}
  
  Future getCurrentUser() async{
    return await _firebaseAuth.currentUser;
  }

 void _controlAuthException({
    required BuildContext context,
    required FirebaseAuthException exception,
  }) {
    showSnackBar(
        context: context,
        message: exception.message ?? 'Error occurred!',
        error: true);
    if (exception.code == 'invalid-email') {
      //
    } else if (exception.code == 'user-disabled') {
      //
    } else if (exception.code == 'user-not-found') {
      //
    } else if (exception.code == 'wrong-password') {
      //
    } else if (exception.code == 'email-already-in-use') {
      //
    } else if (exception.code == 'operation-not-allowed') {
      //
    } else if (exception.code == 'weak-password') {
      //
    }
  }
}