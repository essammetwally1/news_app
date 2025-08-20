import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  final ArticleModel articleModel;
  const NewsItem({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
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
              articleModel.urlToImage ??
                  'https://static.thenounproject.com/png/504708-200.png',
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * .3,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 10),
          Text(articleModel.title!, style: textTheme.titleMedium),
          Row(
            children: [
              Text(
                'By: ${articleModel.author ?? articleModel.source.id}',
                style: textTheme.titleSmall,
              ),
              Spacer(),
              Text(
                timeago.format(articleModel.publishedAt!),
                style: textTheme.titleSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
