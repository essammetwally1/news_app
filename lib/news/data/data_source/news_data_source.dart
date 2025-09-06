import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api_service/api_consts.dart';
import 'package:news_app/news/data/models/news_response.dart';

class NewsDataSource {
  Future<NewsResponse> getNews(String sourceId) async {
    Uri uri = Uri.https(ApiConsts.baseUrl, ApiConsts.apiNewsEndpoint, {
      'apiKey': ApiConsts.apiKey,
      'sources': sourceId,
    });
    http.Response resresponse = await http.get(uri);

    Map<String, dynamic> json = jsonDecode(resresponse.body);

    return NewsResponse.fromJson(json);
  }
}
