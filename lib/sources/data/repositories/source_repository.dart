import 'package:news_app/sources/data/data_sources/sources_datasource.dart';
import 'package:news_app/sources/data/models/api_source_model.dart';

class SourceRepository {
  SourcesDatasource datasource;
  SourceRepository(this.datasource);

  Future<List<SourceModel>> getSources(String categoryId) {
    return datasource.getSources(categoryId);
  }
}
