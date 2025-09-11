import 'package:news_app/news/data/models/article_model.dart';

abstract class NewsDatasource {
  Future<List<ArticleModel>> getNews(String sourceId);
}
