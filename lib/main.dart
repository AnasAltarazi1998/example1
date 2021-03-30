import 'package:example1/Consts.dart';
import 'package:example1/Gallery.dart';
import 'package:example1/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/home": (_) => Home(),
        "/gallery": (_) => Gallery(),
      },
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
