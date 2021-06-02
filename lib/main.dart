import 'package:example1/auth/pages/SignIn.dart';
import 'package:example1/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'bloc Auth',
      initialRoute: '/home',
      routes: {'/home': (_) => SignIn(), '/profile': (_) => Profile()},
    );
  }
}
