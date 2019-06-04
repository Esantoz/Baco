import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:baco/screens/homeScreens.dart';
import 'package:baco/utils/auth.dart';
import 'dart:async';

import 'package:baco/utils/drawer.dart';


Color firstColor = Color(0xff311b92);
Color secondColor = Color(0xffb39ddb);


class LoginScreen extends StatefulWidget{

  final BaseAuth auth;
  final VoidCallback onSignedIn;

  LoginScreen({this.auth,this.onSignedIn});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreenState();
  }

}
class _LoginScreenState extends State<LoginScreen>{

  String phoneNu;
  String smsCode;
  String VerificationId;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]
    );
    return Scaffold(

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: 400.0,
          height: 640,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [firstColor,secondColor]),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:200.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  child: Container(
                    height: 250.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400.withOpacity(0.1),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 50.0,),
                        Center(
                          child: Text("Número de Telefone",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Row(
                          children: <Widget>[
                            SizedBox(width: 10.0,),
                            Icon(Icons.phone,color: Colors.white,),
                            SizedBox(width: 10,),
                            Container(
                              width: 230.0,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                              ),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                decoration: InputDecoration(fillColor: Colors.white,hintText: "Telefone"),
                                onChanged: (value){
                                  this.phoneNu = value;
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        FlatButton(
                          color: Colors.white.withOpacity(0.1),
                          child: Text("Entrar",style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                          ),
                          onPressed: (){
                            widget.auth.verifyPhone(this.phoneNu);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}