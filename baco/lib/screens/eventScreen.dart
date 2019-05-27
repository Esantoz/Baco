import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'homeScreens.dart';
import 'package:intl/intl.dart';



var i;
const Color firstColor = Color(0xff311b92);

var bf,bm;

class EventScreen extends StatefulWidget{
  String src,tag,titulo,descricao;
  int desconto;
  List<Lotes> lotes;

  EventScreen(this.src,this.tag,this.titulo,this.descricao,this.lotes,[this.desconto]);

  @override
  State<StatefulWidget> createState() {
    i = lotes.length;
    return EventScreenState();
  }
}

class EventScreenState extends State<EventScreen>{
  var fIcon = Icons.favorite_border;
  int nLotes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:Column(
          children: <Widget>[
            Material(
              elevation: 5.0,
              child:Align(
                alignment: Alignment.topCenter,
                child: Hero(
                    tag: widget.tag,
                    child: Container(
                      height: 300,
                      width: 360,
                      child: Image.asset(widget.src,fit: BoxFit.fill,),
                    )
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                SizedBox(width: 20.0,),
                Transform.scale(
                  scale: 1.5,
                  child:InkWell(
                    child: Icon(Icons.share,color: firstColor,),
                    onTap: (){},
                  ),
                ),
                SizedBox(width: 30.0,),
                Transform.scale(
                  scale: 1.5,
                  child:InkWell(
                    child: Icon(Icons.send,color: firstColor,),
                    onTap: (){},
                  ),
                ),
                Spacer(),
                Transform.scale(
                  scale: 1.5,
                  child:InkWell(
                    child: Icon(Icons.report,color: firstColor,),
                    onTap: (){},
                  ),
                ),
                SizedBox(width: 20.0,)
              ],
            ),
            SizedBox(height: 20,),
            titulo(),
            SizedBox(height: 20.0,),
            Align(
              alignment: Alignment.topLeft,
              child:Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Descrição: ",style: TextStyle(color: firstColor,fontSize: 16,fontWeight: FontWeight.bold),)
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:20.0,right: 20.0,bottom: 30.0,top: 10.0),
              child: Text(widget.descricao,style: TextStyle(fontSize: 16.0,),),
            ),

            Align(
              alignment: Alignment.topLeft,
              child:Container(
                padding: EdgeInsets.only(left: 20),
                child:Text("Ingressos",style: TextStyle(fontSize: 16,color: firstColor,fontWeight: FontWeight.bold),),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left:5,right: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400,width: 5)
              ),
              child:Column(
                children: widget.lotes,
              )
            ),
          ],
        ),
      ),
    );
  }


  Widget titulo(){
      return Align(
        alignment: Alignment.center,
        child:Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(widget.titulo,style: TextStyle(color: firstColor,fontSize: 16,fontWeight: FontWeight.bold),)
        ),
      );
  }



}

class Lotes extends StatelessWidget{
  EventScreenState ess;
  double valorHomem,valorMulher;
  int qLotes;

  Lotes(this.valorHomem,this.valorMulher,this.qLotes);
  final f = NumberFormat.simpleCurrency();
  final m = NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(top: 5,left: 20),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade400)
          )
      ),

      child:Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 5.0,bottom: 10.0),
            child: Text("$qLotesº Lote:"),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 71.0,bottom: 10.0,),
                child: Text("Feminino: R${f.format(valorMulher)}",style: TextStyle(color: Colors.blueAccent),),
              ),
              button(),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 65.0,bottom: 10.0,),
                child: Text("Masculino: R${m.format(valorHomem)}",style: TextStyle(color: Colors.blueAccent)),
              ),
              button(),
            ],
          )
        ],
      ),

    );
  }

}

Widget button(){
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child:RaisedButton(
          color: Colors.red,
          child: Text("Comprar"),
          onPressed: (){},
        )
    );
}



















