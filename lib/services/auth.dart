import 'package:Gossips/screens/home.dart';
import 'package:Gossips/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Gossips/services/database.dart';

class Auth {
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, sanpshot) {
          if (sanpshot.hasData) {
            return Home();
          } else {
            return Register();
          }
        });
  }

  //sign in with email & password
  void signin(String e, String p) async {
    FirebaseAuth.instance.signInWithEmailAndPassword(email: e, password: p);
  }

  //register with email and password
  void register(String email, String password) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {
          Database().createUserProfile('user.png','User', email, 'Hello everyone!')
        });
  }

  //get current user id
  String getUID() {
    return FirebaseAuth.instance.currentUser.uid;
  }

  //reset password
  void reset(email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  //signout
  void signout() {
    FirebaseAuth.instance.signOut();
  }
} //end of class auth
