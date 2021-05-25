import 'package:example1/home.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/home': (_) => Home(), '/profile': null},
      initialRoute: '/home',
      theme: ThemeData(primarySwatch: Colors.indigo),
    );
  }
}
