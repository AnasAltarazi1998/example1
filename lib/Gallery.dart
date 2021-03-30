import 'package:example1/Consts.dart';
import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  Gallery({Key key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('image viewer')),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imgs[index],
              height: 600,
            ),
            Padding(padding: EdgeInsets.all(8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: index != 0
                          ? Colors.blue.shade100
                          : Colors.blue.shade400),
                  onPressed: () {
                    print(index);
                    setState(() {
                      index = index != 0 ? --index : index;
                    });
                  },
                  child: Text(
                    'prev',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: index != imgs.length - 1
                          ? Colors.blue.shade100
                          : Colors.blue.shade400),
                  onPressed: () {
                    print(index);
                    setState(() {
                      index = index != imgs.length - 1 ? ++index : index;
                    });
                  },
                  child: Text(
                    'next',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
