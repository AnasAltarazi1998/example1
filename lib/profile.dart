import 'package:example1/inh_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String email;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    email = Get.find(tag: 'email');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              'email : $email',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'password : ${BaseWidget.of(context).password}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
