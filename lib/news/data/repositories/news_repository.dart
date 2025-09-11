import 'package:news_app/news/data/data_source/news_datasource.dart';
import 'package:news_app/news/data/models/article_model.dart';

class NewsRepository {
  NewsDatasource newsDatasource;
  NewsRepository(this.newsDatasource);

  Future<List<ArticleModel>> getNews(String sourceId) {
    return newsDatasource.getNews(sourceId);
  }
}
