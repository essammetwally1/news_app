import 'package:flutter/material.dart';
import 'package:news_app/categories/categories_view.dart';
import 'package:news_app/components/home_drawer.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/news/news_view.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homescreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory == null ? 'Home' : selectedCategory!.name),
        surfaceTintColor: Colors.transparent,
      ),
      drawer: HomeDrawer(goToHome: goToHome),

      body: selectedCategory == null
          ? CategoriesView(onSelectCategory: onSelectCategory)
          : NewsView(categoryId: selectedCategory!.id),
    );
  }

  void onSelectCategory(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }

  void goToHome() {
    if (selectedCategory == null) {
      Navigator.of(context).pop();
    } else {
      selectedCategory = null;
      Navigator.of(context).pop();
      setState(() {});
    }
  }
}
