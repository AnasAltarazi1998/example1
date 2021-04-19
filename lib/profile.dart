import 'package:example1/about.dart';
import 'package:example1/contactus.dart';
import 'package:example1/settings.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int currentIndx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildBody(currentIndx),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndx,
        type: BottomNavigationBarType.fixed,
        // backgroundColor: Color(0xFF6200EE),
        // selectedItemColor: Colors.white,
        // unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 12,
        onTap: (value) {
          setState(() {
            print(value);
            currentIndx = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'Music',
            icon: Icon(Icons.music_note),
          ),
          BottomNavigationBarItem(
            label: 'Places',
            icon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            label: 'News',
            icon: Icon(Icons.library_books),
          ),
        ],
      ),
    );
  }

  Widget buildBody(int i) {
    if (i == 0)
      return About();
    else if (i == 1)
      return Contact();
    else if (i == 2) return Settings();
  }
}
