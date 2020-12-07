import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:noticias/models/newsArticle.dart';

class Webservice {
  Future<List<NewsArticle>> fetchTopHeadLines() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=a63df34422a14259beed89ec5000f95a";

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw Exception("Failed to get top news");
    }
  }
}
