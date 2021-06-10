import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {
  Future<SharedPreferences> _initSharedPref() async {
    return await SharedPreferences.getInstance();
  }

  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('data'),
            ElevatedButton(
              onPressed: () async {
                SharedPreferences sharedPreferences = await _initSharedPref();
                sharedPreferences.clear();
                Get.offAllNamed('/home');
              },
              child: Text('logout'),
            ),
          ],
        ),
      ),
    );
  }
}
