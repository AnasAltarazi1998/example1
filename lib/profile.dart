import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Collapsing Toolbar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background: Image.asset(
                    "assets/appbar.jpg",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Center(
          child: Text("Sample text"),
        ),
      ),
    );
  }
}
