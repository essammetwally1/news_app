import 'package:news_app/news/data/data_source/news_api_data_source.dart';
import 'package:news_app/news/data/data_source/news_datasource.dart';
import 'package:news_app/sources/data/data_sources/source_api_datasource.dart';
import 'package:news_app/sources/data/data_sources/sources_datasource.dart';

class ServiceLocator {
  static SourcesDatasource sourcesApiDatasource = SourceApiDatasource();
  static NewsDatasource newsApiDatasource = NewsApiDataSource();
}
