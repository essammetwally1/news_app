import 'package:flutter/material.dart';
import 'package:news_app/news/data/models/article_model.dart';
import 'package:news_app/news/data/repositories/news_repository.dart';
import 'package:news_app/shared/service_locator.dart';

class NewsViewmodel with ChangeNotifier {
  late NewsRepository newsRepository;

  NewsViewmodel() {
    newsRepository = NewsRepository(ServiceLocator.newsApiDatasource);
  }

  List<ArticleModel> newsList = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> getNews(String source) async {
    isLoading = true;

    try {
      newsList = await newsRepository.getNews(source);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
