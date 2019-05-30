import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




const Color firstColor = Color(0xff311b92);
const Color secondColor = Color(0xffb39ddb);

class IngressosScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child:  AppBar(
              iconTheme: IconThemeData(color: firstColor),
              backgroundColor: secondColor.withOpacity(0.5),
              title: Padding(
                padding: const EdgeInsets.only(left:60.0),
                child: Text("Ingressos",
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