import 'package:example1/articles/models/articleModel.dart';
import 'package:flutter/material.dart';

class HArticleForm extends StatelessWidget {
  HArticleForm({
    this.articleModel,
    Key key,
  }) : super(key: key);
  ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://tse4.mm.bing.net/th/id/OIP.03JW-SadNng_Mj6QbSbVaAHaFH?pid=ImgDet&rs=1'),
            ),
            Text(articleModel.title)
          ],
        ),
      ),
    );
  }
}
