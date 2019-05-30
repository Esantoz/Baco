import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


const Color firstColor = Color(0xff311b92);
const Color secondColor = Color(0xffb39ddb);

class SettingsScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>  _SettingsScreenState();

}

class _SettingsScreenState extends State<SettingsScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 80.0,),
                CustomItems(Icons.clear,"Apagar dados pessoais",(){}),
              ],
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child:AppBar(
              iconTheme: IconThemeData(color: firstColor),
              backgroundColor: secondColor.withOpacity(0.5),
              title: Padding(
                padding: const EdgeInsets.only(left:40.0,bottom: 12),
                child: Text("Configurações",
                  style: TextStyle(
                    color: firstColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
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
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade400)
              ),
            ),
            height: 60.0,
            child: Row(
              children: <Widget>[
                Icon(icon,color: Colors.black,),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child:Text(text,style: TextStyle(fontSize: 19.0,color: Colors.black),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}