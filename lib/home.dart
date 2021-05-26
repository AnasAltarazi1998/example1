import 'package:example1/User.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final emailController = TextEditingController();
  SharedPreferences sharedPreferences;

  initSharedPrefrences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  final passwordController = TextEditingController();
  @override
  void initState() {
    initSharedPrefrences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Demo App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'E-mail'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'password'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                final user = User(
                    email: emailController.text,
                    password: passwordController.text);
                Get.put(user, tag: 'userInfo');
                sharedPreferences.setString('email', user.email);
                sharedPreferences.setString('password', user.password);
                sharedPreferences.setString('initialRoute', '/profile');
                Navigator.of(context).pushReplacementNamed('/profile');
              },
              child: Text('Sign In'),
            ),
          ),
        ],
      ),
    );
  }
}
