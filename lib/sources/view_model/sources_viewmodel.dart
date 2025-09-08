import 'package:flutter/cupertino.dart';
import 'package:news_app/sources/data/data_sources/source_datasource.dart';
import 'package:news_app/sources/data/models/api_source_model.dart';

class SourcesViewmodel with ChangeNotifier {
  SourceDatasource datasource = SourceDatasource();
  List<SourceModel> sources = [];
  String? errorMessage;
  bool isLoading = false;
  Future<void> getSources(String categoryId) async {
    isLoading = true;
    try {
      sources = await datasource.getSources(categoryId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
