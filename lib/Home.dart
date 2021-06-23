import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _value = 0;
  double width = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app-title'.tr()),
      ),
      floatingActionButton: FloatingActionButton(
          child: Center(child: Icon(Icons.add)),
          onPressed: () {
            setState(() {
              width += 100;
            });
          }),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
              opacity: _value / 10,
              child: AnimatedContainer(
                curve: Curves.bounceIn,
                duration: Duration(seconds: 4),
                alignment: Alignment.center,
                child: Text(
                  'data',
                  style: TextStyle(fontSize: width / 5),
                ),
                width: width,
                height: 100,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            Slider(
              value: _value,
              divisions: 20,
              activeColor: Colors.indigo,
              label: '$_value',
              onChanged: (value) {
                setState(() {
                  _value = value;
                  print(_value);
                });
              },
              min: 0,
              max: 10,
            )
          ],
        ),
      ),
    );
  }
}
