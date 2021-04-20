import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a Builder to get a context within the Scaffold.
      body: Builder(
        builder: (context) {
          return Center(
            child: TextButton(
              child: Text('SHOW BOTTOM SHEET'),
              onPressed: () {
                showBottomSheet(
                  context: context,
                  builder: (_) {
                    final theme = Theme.of(context);
                    // Using Wrap makes the bottom sheet height the height of the content.
                    // Otherwise, the height will be half the height of the screen.
                    return Container(
                      height: 500,
                      color: Colors.indigo,
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
