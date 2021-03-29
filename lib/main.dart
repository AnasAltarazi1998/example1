import 'package:flutter/material.dart';

void main() {
  int i = 0;
  runApp(
    MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => print(" ${i++} pressed"),
        ),
        body: Container(
          child: Text(
            'hello flutter $i',
            style: TextStyle(fontSize: 30),
          ),
          alignment: Alignment.center,
        ),
        appBar: AppBar(
          title: Text('title'),
        ),
      ),
    ),
  );
}
