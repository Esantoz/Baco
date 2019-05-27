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


  CircleAvatar gmail = CircleAvatar(
    backgroundImage: AssetImage("images/google.jpg"),
  );
  CircleAvatar facebook = CircleAvatar(
    backgroundImage: AssetImage("images/facebook.png"),
  );
  CircleAvatar twitter = CircleAvatar(
    backgroundImage: AssetImage("images/twitter.png"),
  );


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
      appBar: AppBar(
        elevation: 20.0,
        title: Center(child: Text("Baco",style: TextStyle(color: firstColor,fontWeight: FontWeight.bold),)),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [firstColor,secondColor]),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 150.0,left: 80.0),
              child:Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    child:Container(
                      //elevation: 100.0,
                      color: Colors.white,
                      child:Container(
                        height: 230,
                        width: 200,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20,),
                            Center(child: Text("Faça login com",style: TextStyle(fontSize: 20),)),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0,left: 30.0),
                              child:Column(
                                children: <Widget>[
                                  GestureDetector(
                                    child:Row(
                                      children: <Widget>[
                                        gmail,
                                        Text(" Google",style: TextStyle(fontSize: 20.0),),
                                      ],
                                    ),
                                    onTap: () async{
                                      await widget.auth.signInGoogle()
                                          .then((FirebaseUser user) => print(user))
                                          .catchError((e) => print(e));
                                      widget.onSignedIn();
                                    },
                                  ),
                                  SizedBox(height: 15.0,),
                                  GestureDetector(
                                    child:Row(
                                      children: <Widget>[
                                        facebook,
                                        Text(" facebook",style: TextStyle(fontSize: 20.0),),
                                      ],
                                    ),
                                    onTap: (){

                                    },
                                  ),
                                  SizedBox(height: 15.0,),
                                  GestureDetector(
                                    child:Row(
                                      children: <Widget>[
                                        twitter,
                                        Text(" Twitter",style: TextStyle(fontSize: 20.0),),
                                      ],
                                    ),
                                    onTap: (){
                                      debugPrint("Twitter auth");
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top:160.0),
              child: Text("Criado por "),
            ),
          ],
        ),
      ),
    );
  }
}