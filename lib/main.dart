import 'package:example1/home.dart';
import 'package:example1/inh_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: GetMaterialApp(
        title: 'Material App',
        home: Home(),
      ),
    );
  }
}
