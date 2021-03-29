import 'package:flutter/material.dart';

class PageBody extends StatelessWidget {
  const PageBody({
    Key key,
    @required this.i,
  }) : super(key: key);

  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'hello flutter $i',
        style: TextStyle(fontSize: 30),
      ),
      alignment: Alignment.center,
    );
  }
}
