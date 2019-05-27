import 'package:flutter/material.dart';
import 'package:baco/screens/homeScreens.dart';
import 'package:baco/utils/auth.dart';
import 'loginScreen.dart';

class RootScreen extends StatefulWidget{

  final BaseAuth auth;
  RootScreen({this.auth});


  @override
  State<StatefulWidget> createState() {
    return _RootScreenState();
  }

}

enum AuthStatus{
  notSignedIn,
  signedIn
}


class _RootScreenState extends State<RootScreen>{
  AuthStatus authStatus = AuthStatus.notSignedIn;

  void initState(){
    super.initState();
    widget.auth.currentUser().then((userId) {
      setState(() {
        authStatus = userId == null ? AuthStatus.notSignedIn: AuthStatus.signedIn;
      });

    });
  }

  void _signedIn(){
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut(){
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch(authStatus){
      case AuthStatus.notSignedIn:
        return LoginScreen(
          auth: widget.auth,
          onSignedIn: _signedIn,
        );
      case AuthStatus.signedIn:
        return HomeScreens(
          auth: widget.auth,
          onSignedOut: _signedOut,
        );
    }
  }

}