import 'dart:convert';

import 'package:ecnhrf/data/article_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static Future<ArticleModel?> fetchArticles() async {
    var url = Uri.parse('http://devapi.hidoc.co:8080/HidocWebApp/api/getArticlesByUid');

    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var body = {
      'sId': '500',
      'uuId': '',
      'userId': '423914',
    };

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      var responseBody = response.body;
      print('Response body: $responseBody');

      try {
        var parsedJson = json.decode(responseBody);
        var articleModel = ArticleModel.fromJson(parsedJson['data']);
        print('Parsed articleModel: $articleModel');
        return articleModel;
      } catch (e) {
        print('Error parsing JSON: $e');
        return null;
      }
    } else {
      print('Request failed with status: ${response.statusCode}');
      return null;
    }
  }
}