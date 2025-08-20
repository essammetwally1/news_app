import 'package:flutter/material.dart';
import 'package:news_app/api_service/api_service.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/components/error_indicator.dart';
import 'package:news_app/components/loading_indicator.dart';
import 'package:news_app/models/api_source_model.dart';
import 'package:news_app/models/api_source_response.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/news/tab_item.dart';

class NewsView extends StatefulWidget {
  final String categoryId;
  const NewsView({super.key, required this.categoryId});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  late Future<SourceResponse> sourceResponse = ApiService.getSources(
    widget.categoryId,
  );
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sourceResponse,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return ErrorIndicator();
        } else {
          List<SourceModel> sources = snapshot.data?.sources ?? [];
          return Column(
            children: [
              SizedBox(height: 16),
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

              sources.isNotEmpty
                  ? Expanded(
                      child: FutureBuilder(
                        future: ApiService.getNews(sources[currentIndex].id!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return LoadingIndicator();
                          } else if (snapshot.hasError ||
                              snapshot.data!.status != 'ok') {
                            print(snapshot.error);
                            return ErrorIndicator();
                          } else {
                            List<ArticleModel> articles =
                                snapshot.data?.articles ?? [];
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                                top: 16,
                              ),
                              child: ListView.separated(
                                itemBuilder: (_, index) =>
                                    NewsItem(articleModel: articles[index]),
                                separatorBuilder: (_, _) =>
                                    SizedBox(height: 16),
                                itemCount: articles.length,
                              ),
                            );
                          }
                        },
                      ),
                    )
                  : Text(
                      'No Data',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
            ],
          );
        }
      },
    );
  }
}
