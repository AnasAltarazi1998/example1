import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool favIndicator = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        bottom: PreferredSize(
            child: Container(
              color: Colors.indigo,
            ),
            preferredSize: Size.fromHeight(50)),
        leading: Icon(Icons.search_rounded),
        actions: [
          IconButton(
            icon: Icon(favIndicator ? Icons.favorite : Icons.favorite_border),
            onPressed: changeFavState,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              icon: Icon(Icons.person),
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed('/profile'),
            ),
          )
        ],
        title: Text('app title'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text('body value'),
      ),
    );
  }

  changeFavState() {
    setState(() {
      favIndicator = !favIndicator;
    });
  }
}
