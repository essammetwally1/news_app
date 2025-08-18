import 'package:flutter/material.dart';
import 'package:news_app/models/post_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  final PostModel postModel;
  const NewsItem({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    DateTime dateTimeDemo = DateTime.now().subtract(Duration(minutes: 15));
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
            child: Image.asset(
              'assets/${postModel.imagePath}.png',
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * .3,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 10),
          Text(postModel.title, style: textTheme.titleMedium),
          Row(
            children: [
              Text('By: Essam metwally', style: textTheme.titleSmall),
              Spacer(),
              Text(timeago.format(dateTimeDemo), style: textTheme.titleSmall),
            ],
          ),
        ],
      ),
    );
  }
}
