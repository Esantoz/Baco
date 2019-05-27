import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'drawer.dart';

abstract class BaseAuth{
  Future<FirebaseUser> signInGoogle();
  Future<String> currentUser();
  Future<void> signOut();

}

class Auth implements BaseAuth{
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<FirebaseUser> signInGoogle() async{
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken
    );
    final FirebaseUser user = await _auth.signInWithCredential(credential);
    print("signed in ${user.displayName}");
    return user;
  }

  Future<String> currentUser() async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }


  Future<void> signOut() async {
    return FirebaseAuth.instance.signOut();
  }

}










