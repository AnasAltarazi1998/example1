import 'package:example1/home.dart';
import 'package:example1/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // sharedPreferences.clear();
  runApp(MyApp(
    home: sharedPreferences.getString("initialRoute") ?? "/home",
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key key, @required this.home}) : super(key: key);
  String home;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {'/home': (_) => Home(), '/profile': (_) => Profile()},
      initialRoute: home,
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          tabBarTheme: TabBarTheme(
              labelColor: Colors.indigo,
              labelStyle: TextStyle(color: Colors.indigo))),
    );
  }
}
