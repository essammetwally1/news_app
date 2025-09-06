import 'package:flutter/material.dart';
import 'package:news_app/api_service/api_service.dart';
import 'package:news_app/components/error_indicator.dart';
import 'package:news_app/components/loading_indicator.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/news/news_item.dart';

class SearchScreen extends StatefulWidget {
  final String categoryId;
  const SearchScreen({super.key, required this.categoryId});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<NewsResponse> newsResponse;

  @override
  void initState() {
    super.initState();
    newsResponse = ApiService.getAllNews(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: newsResponse,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          print(snapshot.error);
          return const ErrorIndicator();
        } else {
          List<ArticleModel> articles = snapshot.data?.articles ?? [];
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: ListView.separated(
              itemBuilder: (_, index) =>
                  NewsItem(articleModel: articles[index]),
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemCount: articles.length,
            ),
          );
        }
      },
    );
  }
}
