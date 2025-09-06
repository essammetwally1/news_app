import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api_service/api_consts.dart';
import 'package:news_app/sources/data/models/api_source_response.dart';

class SourceDatasource {
  Future<SourceResponse> getSources(String categoryId) async {
    Uri uri = Uri.https(ApiConsts.baseUrl, ApiConsts.apiSourcesEndpoint, {
      'apiKey': ApiConsts.apiKey,
      'category': categoryId,
    });
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);

    return SourceResponse.fromJson(json);
  }
}
