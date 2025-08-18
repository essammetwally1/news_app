class PostModel {
  final String id;
  final String imagePath;
  final String title;

  PostModel({required this.id, required this.imagePath, required this.title});

  static List<PostModel> posts = [
    PostModel(
      id: '0',
      imagePath: 'image1',
      title:
          '40-year-old man falls 200 feet to his death while canyoneering at national park',
    ),
    PostModel(
      id: '1',
      imagePath: 'image2',
      title:
          'Nobel Prize in physics awarded to two scientists for machine learning discoveries',
    ),
    PostModel(
      id: '0',
      imagePath: 'image1',
      title:
          '40-year-old man falls 200 feet to his death while canyoneering at national park',
    ),
    PostModel(
      id: '1',
      imagePath: 'image2',
      title:
          'Nobel Prize in physics awarded to two scientists for machine learning discoveries',
    ),
    PostModel(
      id: '0',
      imagePath: 'image1',
      title:
          '40-year-old man falls 200 feet to his death while canyoneering at national park',
    ),
    PostModel(
      id: '1',
      imagePath: 'image2',
      title:
          'Nobel Prize in physics awarded to two scientists for machine learning discoveries',
    ),
  ];
}
