import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 8, left: 8, right: 8),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2 - 5,
          color: Colors.indigo,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3 - 10,
              height: MediaQuery.of(context).size.height / 6 - 13,
              color: Colors.indigo,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3 - 10,
              height: MediaQuery.of(context).size.height / 6 - 13,
              color: Colors.indigo,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3 - 10,
              height: MediaQuery.of(context).size.height / 6 - 13,
              color: Colors.indigo,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2 - 10,
              height: MediaQuery.of(context).size.height / 6 - 13,
              color: Colors.indigo,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2 - 10,
              height: MediaQuery.of(context).size.height / 6 - 13,
              color: Colors.indigo,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 6,
                height: MediaQuery.of(context).size.height / 6 - 13,
                color: Colors.indigo,
              ),
              Spacer(),
              Container(
                width: MediaQuery.of(context).size.width / 6,
                height: MediaQuery.of(context).size.height / 6 - 13,
                color: Colors.indigo,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
