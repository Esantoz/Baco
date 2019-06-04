import 'package:baco/screens/homeScreens.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart';
import 'drawer.dart';

abstract class BaseAuth{
  Future<void> verifyPhone(String phoneN);
  Future<String> currentUser();
  Future<void> signOut();

}

class Auth implements BaseAuth{
  String smsCode;
  String verificationId;


  Future<void> verifyPhone(String phoneN) async{
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId){
      this.verificationId = verId;
    };

    final PhoneCodeSent smsCodeSent = (String verId,[int forceCodeResend]){
      this.verificationId = verId;

    };

    final PhoneVerificationCompleted verifiedSucces = (FirebaseUser user){
      print("verified");
    } as PhoneVerificationCompleted;

    final PhoneVerificationFailed verifiedFailed = (AuthException exception){
      print("${exception.message}");
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneN,
      codeAutoRetrievalTimeout: autoRetrieve,
      codeSent: smsCodeSent,
      timeout: const Duration(seconds: 5),
      verificationCompleted: verifiedSucces,
      verificationFailed: verifiedFailed,
    );
  }

  Future<bool> smsCodeDialog(BuildContext context){
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Digite o código do sms"),
          content: TextField(
            onChanged: (value){
              this.smsCode = value;
            },
          ),

          contentPadding: EdgeInsets.all(10.0),
          actions: <Widget>[
            FlatButton(
              child: Text("Feito"),
              onPressed: (){
                FirebaseAuth.instance.currentUser().then((user){
                  if(user != null){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context){
                            return HomeScreens();
                          }
                        ),
                    );
                  }
                  else{
                    Navigator.of(context).pop();
                    signIn(this.smsCode);
                  }

                });
              },
            ),
          ],

        );
      }
    );
  }

  Future<String> signIn(String smscode) async{
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: smscode,
    ); 
    final FirebaseUser user = await FirebaseAuth.instance.signInWithCredential(credential);
    final FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    assert(user.uid == currentUser.uid);
    return "entrou com o numero: $user";
  }

  Future<String> currentUser() async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }


  Future<void> signOut() async {
    return FirebaseAuth.instance.signOut();
  }

}










