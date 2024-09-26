import 'dart:convert';

import '../model/news.dart';
import 'package:http/http.dart' as http;

class NewsController {
  Future<List<News>> getNews() async {
    final response = await http.get(Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=d5081a6c3a3a45cbb24fd0c65fdb736f",
    ));
    if (response.statusCode == 200) {
      List<News> news = [];
      var articles = jsonDecode(response.body)['articles'];

      for (var singleNews in articles) {
        news.add(News.fromJson(singleNews));
      }
      return news;
    } else {
      throw Exception('Failed to load news');
    }
  }
}
