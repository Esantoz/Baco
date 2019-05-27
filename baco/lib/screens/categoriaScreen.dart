import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'homeScreens.dart';
import 'eventScreen.dart';



const Color firstColor = Color(0xff311b92);
const Color secondColor = Color(0xffb39ddb);
class CategoriaScreen extends StatelessWidget{
  List<EventCard> events;
  String titulo;

  CategoriaScreen(this.titulo,this.events);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Container(
                      height: 90.0,
                      width: 365.0,
                      decoration: BoxDecoration(
                        gradient: (LinearGradient(
                          colors: [
                            firstColor,
                            secondColor,
                          ],
                        )),
                      ),
                      child: Center(
                        child: Text(titulo,style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                    )
                ),
              ],
            ),
            Column(
              children: events,

            ),
          ],
        ),
      ),
    );
  }

}