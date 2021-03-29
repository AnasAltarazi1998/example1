import 'package:example1/LoadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PageBody extends StatelessWidget {
  const PageBody({
    Key key,
    @required this.i,
  }) : super(key: key);

  final int i;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadingWidget(),
        LoadingWidget(),
        LoadingWidget(),
        LoadingWidget(),
      ],
    );
  }
}
