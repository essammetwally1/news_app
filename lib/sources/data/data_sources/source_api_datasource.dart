import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/shared/api_consts.dart';
import 'package:news_app/sources/data/data_sources/sources_datasource.dart';
import 'package:news_app/sources/data/models/api_source_model.dart';
import 'package:news_app/sources/data/models/api_source_response.dart';

class SourceApiDatasource implements SourcesDatasource {
  @override
  Future<List<SourceModel>> getSources(String categoryId) async {
    Uri uri = Uri.https(ApiConsts.baseUrl, ApiConsts.apiSourcesEndpoint, {
      'apiKey': ApiConsts.apiKey,
      'category': categoryId,
    });
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);

    SourceResponse sourceResponse = SourceResponse.fromJson(json);
    if (sourceResponse.status == 'ok' && sourceResponse.sources != null) {
      return sourceResponse.sources!;
    } else {
      throw Exception('Falid to load sources');
    }
  }
}
