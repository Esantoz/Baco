import 'package:baco/screens/homeScreens.dart';
import 'package:baco/screens/ingressos.dart';
import 'package:baco/screens/rootScreen.dart';
import 'package:baco/utils/auth.dart';
import 'package:flutter/material.dart';

void main() => runApp(
    MaterialApp(
      title: "Baco",
      debugShowCheckedModeBanner: false,
      home: RootScreen(auth: Auth(),),
      theme: appTheme,
    )
);