import 'package:example1/Home.dart';
import 'package:example1/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (_) => Home(),
        '/profile': (_) => Profile(),
      },
      theme: ThemeData(bottomAppBarColor: Colors.blue),
      home: Home(),
    );
  }
}
