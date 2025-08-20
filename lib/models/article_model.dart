class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'] as String?, name: json['name'] as String?);
  }
}

class ArticleModel {
  Source source;
  dynamic author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  ArticleModel({
    required this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as dynamic,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: DateTime.parse(json['publishedAt']) as DateTime?,
      content: json['content'] as String?,
    );
  }
}
