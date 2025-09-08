import 'package:flutter/material.dart';
import 'package:news_app/news/data/data_source/news_data_source.dart';
import 'package:news_app/news/data/models/article_model.dart';

class NewSViewmodel with ChangeNotifier {
  NewsDataSource newsDataSource = NewsDataSource();
  List<ArticleModel> newsList = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> getNews(String source) async {
    isLoading = true;

    try {
      newsList = await newsDataSource.getNews(source);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
