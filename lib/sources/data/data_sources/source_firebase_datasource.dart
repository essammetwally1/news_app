import 'package:news_app/sources/data/data_sources/sources_datasource.dart';
import 'package:news_app/sources/data/models/api_source_model.dart';

class SourceFirebaseDatasource implements SourcesDatasource {
  @override
  Future<List<SourceModel>> getSources(String categoryId) async {
    return [];
  }
}
