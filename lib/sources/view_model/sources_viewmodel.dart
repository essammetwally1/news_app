import 'package:flutter/cupertino.dart';
import 'package:news_app/sources/data/models/api_source_model.dart';
import 'package:news_app/sources/data/repositories/source_repository.dart';

class SourcesViewmodel with ChangeNotifier {
  late SourceRepository sourceRepository;

  SourcesViewmodel() {
    sourceRepository = SourceRepository();
  }

  List<SourceModel> sources = [];
  String? errorMessage;
  bool isLoading = false;
  Future<void> getSources(String categoryId) async {
    isLoading = true;
    try {
      sources = await sourceRepository.getSources(categoryId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
