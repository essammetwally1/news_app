import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api_service/api_consts.dart';
import 'package:news_app/models/api_source_response.dart';
import 'package:news_app/models/news_response.dart';

class ApiService {
  static Future<SourceResponse> getSources(String categoryId) async {
    Uri uri = Uri.https(ApiConsts.baseUrl, ApiConsts.apiSourcesEndpoint, {
      'apiKey': ApiConsts.apiKey,
      'category': categoryId,
    });
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);

    return SourceResponse.fromJson(json);
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    Uri uri = Uri.https(ApiConsts.baseUrl, ApiConsts.apiNewsEndpoint, {
      'apiKey': ApiConsts.apiKey,
      'sources': sourceId,
    });
    http.Response resresponse = await http.get(uri);

    Map<String, dynamic> json = jsonDecode(resresponse.body);

    return NewsResponse.fromJson(json);
  }

  static Future<NewsResponse> getAllNews(String searchWord) async {
    Uri uri = Uri.https(ApiConsts.baseUrl, ApiConsts.apiEverythingEndpoint, {
      'apiKey': ApiConsts.apiKey,
      'q': searchWord,
    });
    http.Response resresponse = await http.get(uri);

    Map<String, dynamic> json = jsonDecode(resresponse.body);

    return NewsResponse.fromJson(json);
  }
}
