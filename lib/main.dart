import 'package:example1/PageBody.dart';
import 'package:flutter/material.dart';

void main() {
  int i = 0;
  runApp(
    MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => print(" ${i++} pressed"),
        ),
        body: PageBody(i: i),
        appBar: AppBar(
          title: Text('title'),
        ),
      ),
    ),
  );
}
