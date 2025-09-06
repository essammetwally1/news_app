import 'package:flutter/material.dart';
import 'package:news_app/sources/data/models/api_source_model.dart';

class TabItem extends StatelessWidget {
  final SourceModel sourceModel;
  final bool isSelected;
  const TabItem({
    super.key,
    required this.sourceModel,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return isSelected
        ? Text(
            sourceModel.name ?? 'News.com',
            style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
          )
        : Text(sourceModel.name ?? 'News.com', style: textTheme.titleSmall);
  }
}
