import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('image viewer')),
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            height: 800,
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/img1.png",
            ),
          )),
    );
  }
}
