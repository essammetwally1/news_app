import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/shared/api_consts.dart';
import 'package:news_app/news/data/models/news_response.dart';

class ApiService {
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
