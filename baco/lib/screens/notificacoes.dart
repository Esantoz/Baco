import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const Color firstColor = Color(0xff311b92);
const Color secondColor = Color(0xffb39ddb);

class NotificacoesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              backgroundColor: secondColor.withOpacity(0.5),
              iconTheme: IconThemeData(color: firstColor),
              title: Padding(
                padding: const EdgeInsets.only(left:50.0),
                child: Text("Notificações",
                  style: TextStyle(
                      color: firstColor,
                      fontWeight: FontWeight.bold
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