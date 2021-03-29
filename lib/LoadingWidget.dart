import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.grey,
            ),
            Padding(padding: EdgeInsets.all(8)),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 25,
                  color: Colors.grey,
                ),
                Padding(padding: EdgeInsets.all(8)),
                Container(
                  width: 200,
                  height: 25,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
      alignment: Alignment.topLeft,
    );
  }
}
