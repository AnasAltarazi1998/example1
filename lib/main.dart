import 'package:example1/auth/pages/SignIn.dart';
import 'package:example1/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // sharedPreferences.clear();
  print(sharedPreferences.getString("home"));
  runApp(MyApp(
    home: sharedPreferences.getString("home") ?? "/home",
  ));
}

class MyApp extends StatelessWidget {
  String home;
  MyApp({this.home});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'bloc Auth',
      initialRoute: home,
      routes: {'/home': (_) => SignIn(), '/profile': (_) => Profile()},
    );
  }
}
