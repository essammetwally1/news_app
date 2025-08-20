import 'package:news_app/models/api_source_model.dart';

class SourceResponse {
  String? status;
  List<SourceModel>? sources;

  SourceResponse({this.status, this.sources});

  factory SourceResponse.fromJson(Map<String, dynamic> json) {
    return SourceResponse(
      status: json['status'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map(
            (sourceJson) =>
                SourceModel.fromJson(sourceJson as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}
