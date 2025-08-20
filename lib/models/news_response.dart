import 'article_model.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  List<ArticleModel>? articles;

  NewsResponse({this.status, this.totalResults, this.articles});

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json['status'] as String? ?? '',
      totalResults: json['totalResults'] as int? ?? 0,
      articles:
          (json['articles'] as List<dynamic>?)
              ?.map((articleJson) => ArticleModel.fromJson(articleJson))
              .toList() ??
          [],
    );
  }
}
