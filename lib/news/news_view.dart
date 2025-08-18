import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/post_model.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/news/tab_item.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int currentIndex = 0;
  List<SourceModel> sources = List.generate(
    10,
    (index) => SourceModel(id: '$index', name: 'Source $index'),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: sources.length,

          child: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorColor: AppTheme.white,
            dividerColor: Colors.transparent,
            labelPadding: EdgeInsetsDirectional.only(start: 16),
            onTap: (index) {
              if (currentIndex != index) {
                currentIndex = index;
                setState(() {});
              }
            },

            tabs: sources
                .map(
                  (source) => TabItem(
                    sourceModel: source,
                    isSelected: currentIndex == sources.indexOf(source),
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: ListView.separated(
              itemBuilder: (_, index) =>
                  NewsItem(postModel: PostModel.posts[index]),
              separatorBuilder: (_, _) => SizedBox(height: 16),
              itemCount: PostModel.posts.length,
            ),
          ),
        ),
      ],
    );
  }
}
