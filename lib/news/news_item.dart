import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/screens/webview_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatefulWidget {
  final ArticleModel articleModel;
  const NewsItem({super.key, required this.articleModel});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  bool showDetails = false;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,

      onTap: () {
        showDetails = !showDetails;
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: BoxBorder.all(color: Colors.white),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(8),
              child: Image.network(
                widget.articleModel.urlToImage ??
                    'https://static.thenounproject.com/png/504708-200.png',
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * .3,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 10),
            Text(widget.articleModel.title!, style: textTheme.titleMedium),
            showDetails ? SizedBox(height: 10) : SizedBox(),
            showDetails
                ? Text(
                    widget.articleModel.description!,
                    style: textTheme.titleMedium,
                    maxLines: 4,
                  )
                : SizedBox(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'By: ${widget.articleModel.author ?? widget.articleModel.source.id}',
                    style: textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Spacer(),
                Text(
                  timeago.format(widget.articleModel.publishedAt!),
                  style: textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            showDetails
                ? Column(
                    children: [
                      SizedBox(height: 10),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (widget.articleModel.url != null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WebViewScreen(
                                      url: widget.articleModel.url!,
                                      title:
                                          widget.articleModel.source.name ??
                                          'Article',
                                    ),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppTheme.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'View Full Article',
                              style: textTheme.titleMedium!.copyWith(
                                color: AppTheme.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
