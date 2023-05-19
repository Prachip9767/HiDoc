import 'package:ecnhrf/data/article_model.dart';
import 'package:ecnhrf/ui/widget/top_card_widget.dart';
import 'package:flutter/cupertino.dart';

class NewsWidget extends StatelessWidget {
  List<News> news;

  NewsWidget({required this.news});

  @override
  Widget build(BuildContext context) {
    return news.isNotEmpty? SizedBox(
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: news.length,
          itemBuilder: (context, index) => TopCardWidget(
              imageUrl: news[index].urlToImage,
              articleTitle: news[index].title,
              articleDescription:news[index].description,)),
    ):SizedBox.shrink();
  }
}
