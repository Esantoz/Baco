import 'package:baco/screens/settingsScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:baco/screens/ingressos.dart';
import 'package:baco/screens/notificacoes.dart';
import 'package:baco/utils/auth.dart';


const Color firstColor = Color(0xff311b92);
const Color secondColor = Color(0xffb39ddb);

class MyDrawerItems extends StatefulWidget{
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  MyDrawerItems({this.auth,this.onSignedOut});


  @override
  State<StatefulWidget> createState() {
    return _MyDrawerItems();
  }

}

class _MyDrawerItems extends State<MyDrawerItems>{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  void signOut() async{
    await widget.auth.signOut();
    widget.onSignedOut();
  }

  @override
  void initState(){
    super.initState();
    initUser();
  }

  initUser() async{
    user = await _auth.currentUser();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text("username",style: TextStyle(color: firstColor,fontSize: 20.0,fontWeight: FontWeight.bold),),
      currentAccountPicture: GestureDetector(
        child: CircleAvatar(
          //backgroundImage: NetworkImage("${user.photoUrl}"),
        ),
      ),
      decoration: BoxDecoration(
        gradient: (LinearGradient(
          colors: [
            secondColor,
            Colors.grey.shade400.withOpacity(0.5),
          ],
        )),
      ),

    );

    final drawerItems = SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:Column(
        children: <Widget>[
          drawerHeader,
          CustomItems(Icons.settings,"Configurações",()=> Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context){
                    return SettingsScreen();
                  }
              )
          )),
          CustomItems(Icons.local_offer,"Seus ingressos",()=> Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context){
                  return IngressosScreen();
                }
            ),
          )),
          CustomItems(Icons.notifications,"Notificações",()=> Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context){
                  return NotificacoesScreen();
                }
            ),
          )),
          CustomItems(Icons.exit_to_app,"Sair",(){
            signOut();
          }),
        ]
    ),);
    return drawerItems;
  }

}

class CustomItems extends StatelessWidget{
  IconData icon;
  String text;
  Function onTap;

  CustomItems(this.icon,this.text,this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        child: InkWell(
          splashColor: Colors.blueAccent,
          onTap: onTap,
          child: Container(
            height: 40.0,
            child: Row(
              children: <Widget>[
                Icon(icon,color: firstColor),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child:Text(text,style: TextStyle(fontSize: 16.0,color: firstColor,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}