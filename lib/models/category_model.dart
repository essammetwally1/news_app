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
    CategoryModel(id: '0', name: 'General', imagePath: 'general'),
    CategoryModel(id: '1', name: 'Business', imagePath: 'business'),
    CategoryModel(id: '2', name: 'Entertainment', imagePath: 'entertainment'),
    CategoryModel(id: '3', name: 'Health', imagePath: 'health'),
    CategoryModel(id: '4', name: 'Science', imagePath: 'science'),
    CategoryModel(id: '5', name: 'Sports', imagePath: 'sports'),
    CategoryModel(id: '6', name: 'Technology', imagePath: 'technology'),
  ];
}
