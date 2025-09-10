import 'package:news_app/sources/data/models/api_source_model.dart';

abstract class SourcesDatasource {
  Future<List<SourceModel>> getSources(String categoryId);
}
