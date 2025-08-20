class CategoryModel {
  final String id;
  final String name;
  final String imagePath;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imagePath,
  });

  static List<CategoryModel> categories = [
    CategoryModel(id: 'general', name: 'General', imagePath: 'general'),
    CategoryModel(id: 'business', name: 'Business', imagePath: 'business'),
    CategoryModel(
      id: 'entertainment',
      name: 'Entertainment',
      imagePath: 'entertainment',
    ),
    CategoryModel(id: 'health', name: 'Health', imagePath: 'health'),
    CategoryModel(id: 'science', name: 'Science', imagePath: 'science'),
    CategoryModel(id: 'sports', name: 'Sports', imagePath: 'sports'),
    CategoryModel(
      id: 'technology',
      name: 'Technology',
      imagePath: 'technology',
    ),
  ];
}
