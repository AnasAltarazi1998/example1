import 'package:flutter/material.dart';

class StackAndPositionedDemo extends StatefulWidget {
  @override
  _StackAndPositionedDemoState createState() => _StackAndPositionedDemoState();
}

class _StackAndPositionedDemoState extends State<StackAndPositionedDemo> {
  bool state = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack & Positioned Widget'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(4),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: state ? 125 : 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.red[400],
                child: Text(
                  'Red',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            if (state)
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.black, blurRadius: 10),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: MaterialBanner(
                      content: const Text('Error message text'),
                      leading: CircleAvatar(child: Icon(Icons.delete)),
                      actions: [
                        TextButton(
                          child: const Text('ACTION 1'),
                          onPressed: () {
                            setState(() {
                              state = false;
                            });
                          },
                        ),
                        TextButton(
                          child: const Text('ACTION 2'),
                          onPressed: () {},
                        ),
                      ],
                    )),
              ),
          ],
        ),
      ),
    );
  }
}
