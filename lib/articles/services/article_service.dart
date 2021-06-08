import 'dart:convert';
import 'package:example1/articles/models/ResponeModel.dart';
import 'package:example1/constants/urls.dart';
import 'package:http/http.dart' as http;

class ArticleService {
  Future<ResponseModel> fetchArticles() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Charset': 'utf-8'
    };

    var response = await http.get(
        Uri.parse(
            '$base_article_url?q=tesla&from=2021-05-08&sortBy=publishedAt&apiKey=8688e247e7ed4ee985126fdb7d9a10a4'),
        headers: headers);
    print(response.body);
    ResponseModel responseModel =
        ResponseModel.fromJson(json.decode(response.body));
    return responseModel;
  }
}
