import 'package:flutter/material.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/components/error_indicator.dart';
import 'package:news_app/components/loading_indicator.dart';
import 'package:news_app/news/view_model/news_viewmodel.dart';
import 'package:news_app/sources/data/models/api_source_model.dart';
import 'package:news_app/news/data/models/article_model.dart';
import 'package:news_app/news/view/widgets/news_item.dart';
import 'package:news_app/sources/view/widgets/tab_item.dart';
import 'package:news_app/sources/view_model/sources_viewmodel.dart';
import 'package:provider/provider.dart';

class NewsView extends StatefulWidget {
  final String categoryId;
  const NewsView({super.key, required this.categoryId});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  SourcesViewmodel sourcesViewmodel = SourcesViewmodel();
  NewsViewmodel newsViewmodel = NewsViewmodel();

  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    sourcesViewmodel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sourcesViewmodel,
      child: Consumer<SourcesViewmodel>(
        builder: (_, viewModel, _) {
          if (viewModel.isLoading) {
            return LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(message: viewModel.errorMessage!);
          } else {
            List<SourceModel> sources = viewModel.sources;
            newsViewmodel.getNews(sources[currentIndex].id!);
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
                        // newsViewmodel.getNews(sources[currentIndex].id!);
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
                        child: ChangeNotifierProvider(
                          create: (_) => newsViewmodel,
                          child: Consumer<NewsViewmodel>(
                            builder: (_, viewModel, _) {
                              if (viewModel.isLoading) {
                                return LoadingIndicator();
                              } else if (viewModel.errorMessage != null) {
                                return ErrorIndicator(
                                  message: viewModel.errorMessage!,
                                );
                              } else {
                                List<ArticleModel> articles =
                                    viewModel.newsList;
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
      ),
    );
  }
}
