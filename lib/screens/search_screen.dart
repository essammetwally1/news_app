import 'package:flutter/material.dart';
import 'package:news_app/api_service/api_service.dart';
import 'package:news_app/components/error_indicator.dart';
import 'package:news_app/components/loading_indicator.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/news/news_item.dart';

class SearchScreen extends StatelessWidget {
  final String categoryId;
  SearchScreen({super.key, required this.categoryId});

  late Future<NewsResponse> newsResponse = ApiService.getAllNews(categoryId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: newsResponse,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingIndicator();
          } else if (snapshot.hasError || snapshot.data!.status != 'ok') {
            print(snapshot.error);
            return ErrorIndicator();
          } else {
            List<ArticleModel> articles = snapshot.data?.articles ?? [];
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: ListView.separated(
                itemBuilder: (_, index) =>
                    NewsItem(articleModel: articles[index]),
                separatorBuilder: (_, _) => SizedBox(height: 16),
                itemCount: articles.length,
              ),
            );
          }
        },
      ),
    );
  }
}
