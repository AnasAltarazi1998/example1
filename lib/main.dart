import 'package:example1/auth_button.dart';
import 'package:example1/firebase_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: AddUser('fullName', 'company', 23),
              ),
              Container(
                child: AuthButton('fullName', 'company', 23),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
