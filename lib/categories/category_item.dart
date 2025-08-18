import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String categoryName;
  const CategoryItem({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(16),

      child: Image.asset(
        'assets/categories/$categoryName.png',
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * .25,
        fit: BoxFit.fill,
      ),
    );
  }
}
