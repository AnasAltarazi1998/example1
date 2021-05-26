import 'dart:io';

import 'package:example1/User.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  TabController _tabController;
  User user;
  SharedPreferences sharedPreferences;

  initSharedPrefrences() async {
    sharedPreferences = await SharedPreferences.getInstance();

    user = User(
        email: sharedPreferences.getString('email'),
        password: sharedPreferences.getString('password'));
  }

  @override
  void initState() {
    initSharedPrefrences();
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    initSharedPrefrences();
    sleep(Duration(seconds: 4));
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 6,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/appbar.jpg'),
                              ),
                              title: Text(
                                  '${user.email.substring(0, user.email.indexOf('@'))}'),
                              subtitle: Text('+963-996 332 211'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                                icon: Icon(Icons.lock_open), onPressed: null),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 16),
                        child: Text('E-mail : ${user.email}'),
                      ),
                    ]),
                color: Colors.white,
              ),
              TabBar(
                controller: _tabController,
                tabs: [
                  Tab(
                    text: 'Following',
                    icon: Icon(
                      Icons.favorite,
                    ),
                  ),
                  Tab(text: 'Followers', icon: Icon(Icons.favorite_border)),
                  Tab(
                    text: 'Invitations',
                    icon: Icon(Icons.mark_email_unread),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [Text('people'), Text('Person'), Text('invit')],
                  controller: _tabController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
