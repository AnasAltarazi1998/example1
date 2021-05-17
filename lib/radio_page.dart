import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  RadioPage({Key key}) : super(key: key);

  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Radio & TabBar'),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'DOGS', icon: Icon(Icons.favorite)),
              Tab(text: 'CATS', icon: Icon(Icons.music_note)),
              Tab(text: 'BIRDS', icon: Icon(Icons.search)),
            ],
          ),
        ),
        body: TabBarView(children: [
          Text('index 1'),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                for (int i = 1; i <= 100; i++)
                  ListTile(
                    title: Text(
                      'Radio $i',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: i == 5 ? Colors.black38 : Colors.black),
                    ),
                    leading: Radio<int>(
                      value: i,
                      groupValue: _value,
                      activeColor: Color(0xFF6200EE),
                      onChanged: i == 5
                          ? null
                          : (int value) {
                              setState(() {
                                _value = value;
                              });
                            },
                    ),
                  ),
                CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo),
                  strokeWidth: 3,
                )
              ],
            ),
          ),
          Text('index 2'),
        ]),
      ),
    );
  }
}
