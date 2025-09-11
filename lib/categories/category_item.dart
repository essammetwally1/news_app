import 'package:flutter/material.dart';
import 'package:news_app/shared/app_theme.dart';

class CategoryItem extends StatelessWidget {
  final String categoryName;
  const CategoryItem({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.white),
        boxShadow: [BoxShadow(color: AppTheme.white, blurRadius: 5)],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          'assets/categories/$categoryName.png',
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
