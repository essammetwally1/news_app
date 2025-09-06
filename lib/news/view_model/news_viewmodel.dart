import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/news/data/data_source/news_data_source.dart';
import 'package:news_app/news/data/models/article_model.dart';
import 'package:news_app/news/data/models/news_response.dart';

class NewSViewmodel with ChangeNotifier {
  NewsDataSource newsDataSource = NewsDataSource();
  List<ArticleModel> newsList = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> getNews(String source) async {
    isLoading = true;

    try {
      NewsResponse newsResponse = await newsDataSource.getNews(source);
      if (newsResponse.status == 'ok' && newsResponse.articles != null) {
        newsList = newsResponse.articles!;
      } else {
        log(newsResponse.status.toString());
        log(newsResponse.toString());
        errorMessage = 'Falid to load news';
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
