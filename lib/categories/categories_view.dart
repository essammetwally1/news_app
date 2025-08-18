import 'package:flutter/material.dart';
import 'package:news_app/components/category_item.dart';
import 'package:news_app/models/category_model.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning\nHere is Some News For You',
            style: textTheme.titleLarge,
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => InkWell(
                onTap: () {},
                child: CategoryItem(
                  categoryName: CategoryModel.categories[index].imagePath,
                ),
              ),
              separatorBuilder: (_, _) => SizedBox(height: 10),
              itemCount: CategoryModel.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
