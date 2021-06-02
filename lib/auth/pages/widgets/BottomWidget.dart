import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.grey.shade300,
      shadowColor: Colors.black38,
      child: Container(
        width: double.infinity,
        height: 100,
        child: Center(
          child: Text('stateless view'),
        ),
      ),
    );
  }
}
