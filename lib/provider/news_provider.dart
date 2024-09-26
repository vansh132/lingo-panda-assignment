import 'package:flutter/material.dart';

import '../controller/news_controller.dart';
import '../model/news.dart';

class NewsProvider extends ChangeNotifier {
  final NewsController _newsController = NewsController();
  bool isLoading = false;
  List<News> _news = [];

  List<News> get news => _news;

  Future<void> getAllNews() async {
    isLoading = true;
    notifyListeners();

    _news = await _newsController.getNews();
    isLoading = false;
    notifyListeners();
  }
}
