import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecnhrf/data/article_model.dart';
import 'package:ecnhrf/ui/widget/top_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsWidget extends StatelessWidget {
  final List<Article> news;
  final BuildContext context;

  NewsWidget({Key? key, required this.news, required this.context});

  @override
  Widget build(BuildContext context) {
    return news.isNotEmpty
        ? Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: news.length,
          itemBuilder: (context, index) => Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]!, width: 2),
                ),
                width: double.maxFinite,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: double.maxFinite,
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'News',
                              style: Theme.of(context).textTheme.headline6?.copyWith(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: 18),
                            Text(
                              news[index].articleDescription,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      child: CachedNetworkImage(
                        width: double.infinity,
                        height: double.maxFinite,
                        imageUrl: news[index].articleImg,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    )
        : SizedBox();
  }
}
