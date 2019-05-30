import 'package:baco/utils/auth.dart';
import 'package:baco/utils/customShapeClipper.dart';
import 'package:baco/utils/drawer.dart';
import 'package:baco/utils/searchIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'categoriaScreen.dart';
import 'eventScreen.dart';

const Color firstColor = Color(0xff311b92);
const Color secondColor = Color(0xffb39ddb);

ThemeData appTheme = ThemeData(
    primaryColor: Colors.white,
    fontFamily: "Oxygen"
);

const TextStyle menuItemStyle = TextStyle(color: Colors.black, fontSize: 18.0);
const TextStyle categoriasStyle =
    TextStyle(color: firstColor, fontSize: 22.0, fontWeight: FontWeight.bold);

class HomeScreens extends StatelessWidget {
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  HomeScreens({this.auth, this.onSignedOut});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      //appBar: SearchIcon(),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                HomeScreenTopPart(),
                homeScreenBottomPart,
              ],
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: SearchIcon(),
          )
        ],
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey.shade400.withOpacity(0.5),
        ),
        child:Drawer(
          child: MyDrawerItems(
            auth: auth,
            onSignedOut: onSignedOut,
          ),
        ),
      ),






    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
            ),
            clipBehavior: Clip.hardEdge,
            child: Container(
              height: 400.0,
              width: 365.0,
              decoration: BoxDecoration(
                gradient: (LinearGradient(
                  colors: [
                    firstColor,
                    Colors.black.withOpacity(0.9),
                  ],
                )),
              ),
            )),
      ],
    );
  }
}

var viewStyle = TextStyle(color: Colors.redAccent, fontSize: 15.0);

var homeScreenBottomPart = Column(
  children: <Widget>[
    Row(children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left: 15.0),
        child: Text(
          "Destaques",
          style: categoriasStyle,
        ),
      ),
      Spacer(),
      InkWell(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, right: 15.0),
          child: Text(
            "ver todos[${destaques.length}]",
            style: viewStyle,
          ),
        ),
        onTap: () {
          debugPrint("ver todos taped");
        },
      ),
    ]),
    SizedBox(
      height: 10.0,
    ),
    Container(
      padding: EdgeInsets.only(bottom: 20.0),
      height: 290.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: destaques,
      ),
    ),
    SizedBox(
      height: 25.0,
    ),
    Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Categorias",
            style: categoriasStyle,
          )),
    ),
    SizedBox(
      height: 10,
    ),
    Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              width: 5,
            ),
            Categorias("Esportes", "images/esportes-ingles.jpg",esportes),
            SizedBox(
              width: 10,
            ),
            Categorias("Shows/Festas", "images/festas.jpeg",shows),
            SizedBox(
              width: 10,
            ),
            Categorias("Gospel", "images/religioso.jpg",gospel),
          ],
        ),
        SizedBox(
          height: 5.0,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 30.0,
            ),
            Text("Esportes"),
            SizedBox(
              width: 52.0,
            ),
            Text("Shows/Festas"),
            SizedBox(
              width: 45.0,
            ),
            Text("Gospel"),
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 5.0,
            ),
            Categorias("Nerd/Geek", "images/mario.jpg",nerd),
            //Text("Games\n/Geek"),
            SizedBox(
              width: 10.0,
            ),
            Categorias("Arte/Cultura", "images/arte.jpeg",arte),
            //Text("Arte\n/Cultura"),
            SizedBox(
              width: 10.0,
            ),
            Categorias("Gratuitos/Beneficentes", "images/gratis.png",gratis),
            //Text("Gratuitos\n/Beneficentes"),
          ],
        ),
        SizedBox(
          height: 5.0,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 20.0,
            ),
            Text("Nerd/Geek"),
            SizedBox(
              width: 50.0,
            ),
            Text("Arte/Cultura"),
            SizedBox(
              width: 40.0,
            ),
            Text("Gratuitos\n/Beneficentes"),
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
        Row(
          children: <Widget>[
            SizedBox(
              width: 5.0,
            ),
            Categorias("Negócios", "images/negocio.jpg",negocios),
            //Text("Games\n/Geek"),
            SizedBox(
              width: 10.0,
            ),
            Categorias("Tecnologia", "images/tec.jpeg",tecnologia),
            //Text("Arte\n/Cultura"),
            SizedBox(
              width: 10.0,
            ),
          ],
        ),
        SizedBox(height: 5.0,),
        Row(
          children: <Widget>[
            SizedBox(
              width: 30.0,
            ),
            Text("Negócios"),
            SizedBox(
              width: 50.0,
            ),
            Text("Tecnologia"),
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
      ],
    )
  ],
);

//As informções abaixo são de responsabilidade do back-end

List<Lotes> lotes1 = [
  Lotes(120.20,120.30,1),
  Lotes(130.20,130.30,2)
];
List<Lotes> lotes2 = [
  Lotes(120.50,120.40,1),
];
List<Lotes> lotes3 = [
  Lotes(120.60,120.30,1),
];
List<Lotes> lotes4 = [
  Lotes(120.10,120.20,1),
];


List<EventCard> destaques = [
  EventCard("images/nem.jpg", "Invsores", "ner1d",desc,lotes2,"nerd",true,15),
  EventCard("images/branco.png", "branco","esp1d",desc,lotes4,"esportes",true),
  EventCard("images/download.png", "O jogo da imitação", "tec1d",desc,lotes1,"tecnologia",true),
];

List<EventCard> esportes = [
  EventCard("images/branco.png", "branco","esp1",desc,lotes4,"esportes",true),
];
List<EventCard> shows = List();
List<EventCard> gospel = List();
List<EventCard> nerd = [
  EventCard("images/nem.jpg", "Invsores", "ner1",desc,lotes2,"nerd",true,15),
  EventCard("images/vingadores.jpg", "end game","ner2",desc,lotes3,"nerd",false),
];
List<EventCard> arte = List();
List<EventCard> gratis = List();
List<EventCard> negocios = List();
List<EventCard> tecnologia = [
  EventCard("images/download.png", "O jogo da imitação", "tec1",desc,lotes1,"tecnologia",true),
];



String desc = "testetestetestetestetestetestetestetestetestetestetestetestetesteteste"
    "testetestetestetestetestetestetestetestetestetestetestetestetestetestetesteteste"
    "testetestetestetestetestetestetestetestetestetestetestetestetestetestetesteteste"
    "testetestetestetestetestetestetestetestetestetestetestetestetestetestetesteteste";
//As informações acima são de responsabilidade do back-end

class EventCard extends StatelessWidget {
  double fHeight,fWidth;
  final String imagePath, titulo, tag,descricao,categoria;
  final int desconto;
  List<Lotes> lotes;
  bool destaque;

  EventCard(this.imagePath, this.titulo, this.tag, this.descricao,this.lotes,this.categoria,this.destaque,[this.desconto]);
  @override
  Widget build(BuildContext context) {
    if(destaque == true){
      fHeight = 260.0;
      fWidth = 325.0;
    }
    else if(destaque == false){
      fHeight = 210.0;
      fWidth = 325.0;
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:9.0,vertical: 9.0),
      child: Material(
        elevation: 5.0,
        child: GestureDetector(
            child:Hero(
                tag: tag,
                child:Stack(
                    children: <Widget>[
                      Container(
                        height: fHeight,
                        width: fWidth,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imagePath),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                      discont(desconto),
                      Padding(
                        padding: EdgeInsets.only(top: 10,left: 265),
                        child: MyButton(),
                      )
                    ]
                )
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  if(desconto == null){return EventScreen(imagePath, tag,titulo,descricao,lotes);}
                  else{return EventScreen(imagePath, tag,titulo,descricao,lotes,desconto);}
                }),
              );
            }
        ),
      ),
    );
  }
  Widget discont(int desconto){
    if(desconto == null){
      return Container(
        height: 0.0,
        width: 0.0,
      );
    }
    else{
      return Positioned(
        left: 270,
        bottom: 10,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 2.0,horizontal: 6.0),
          decoration: BoxDecoration(
            gradient: (LinearGradient(
              colors: [
                firstColor,
                secondColor,
              ],
            )),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Text("-$desconto%",style: TextStyle(color: Colors.white,fontSize: 14.0),),
        ),
      );
    }
  }
}

class Categorias extends StatelessWidget {
  String titulo, foto;
  List<EventCard> events;
  Categorias(
    this.titulo,
    this.foto,
    this.events
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      child: Stack(
          children: <Widget>[
            Container(
              height: 100.0,
              width: 110.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: GestureDetector(
                child: Image.asset(foto, fit: BoxFit.fill),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return CategoriaScreen(titulo,events);
                    }),
                  );
                },
              ),
            ),
          ]
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Transform.scale(
          scale: .8,
          child: FloatingActionButton(
              heroTag: null,
              child: Icon(
                Icons.share,
                color: firstColor,
              ),
              backgroundColor: Colors.white.withOpacity(0.7),
              onPressed: () {})),
      Transform.scale(
          scale: .8,
          child: FloatingActionButton(
              heroTag: null,
              child: Icon(
                Icons.send,
                color: firstColor,
              ),
              backgroundColor: Colors.white.withOpacity(0.7),
              onPressed: () {}))
    ]);
  }

}

