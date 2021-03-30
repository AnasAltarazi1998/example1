import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: TextButton(
          child: Text('open Gallery'),
          style: TextButton.styleFrom(backgroundColor: Colors.blue.shade200),
        ),
      ),
    );
  }
}
