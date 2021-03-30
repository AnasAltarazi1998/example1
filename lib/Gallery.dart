import 'package:example1/Consts.dart';
import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  Gallery({Key key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  void imageBefore() {
    print(index);
    setState(() {
      index = index != 0 ? --index : index;
    });
  }

  void imageNext() {
    print(index);
    setState(() {
      index = index != imgs.length - 1 ? ++index : index;
    });
  }

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
            ),
            Padding(padding: EdgeInsets.all(8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.navigate_before,
                    size: 50,
                    color: Colors.blue,
                  ),
                  onPressed: imageBefore,
                ),
                Padding(padding: EdgeInsets.all(8)),
                IconButton(
                  icon: Icon(
                    Icons.navigate_next,
                    size: 50,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    print(index);
                    setState(() {
                      index = index != imgs.length - 1 ? ++index : index;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
