import 'package:example1/articles/models/articleModel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ArticleForm extends StatelessWidget {
  ArticleModel articleModel;
  ArticleForm({
    @required this.articleModel,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: Colors.grey,
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: Image.network(articleModel.urlToImage),
              padding: EdgeInsets.all(16),
            ),
            GestureDetector(
              onTap: () async {
                await launch(articleModel.url);
              },
              child: ListTile(
                title: Text(
                  articleModel.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(articleModel.publishedAt),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(articleModel.description),
            ),
            ButtonBar()
          ],
        ),
      ),
    );
  }
}
