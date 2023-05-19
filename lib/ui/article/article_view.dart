import 'package:ecnhrf/data/article_model.dart';
import 'package:ecnhrf/ui/article/article_controller.dart';
import 'package:ecnhrf/ui/widget/articles_widget.dart';
import 'package:ecnhrf/ui/widget/news_widget.dart';
import 'package:ecnhrf/ui/widget/top_card_widget.dart';
import 'package:ecnhrf/ui/widget/treding_bulletin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/hidoc_bullentin.dart';

class ArticleView extends GetView<ArticleController> {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(top: 14, bottom: 14),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                height: 35,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18)),
                  color: Colors.lightBlueAccent.withOpacity(0.4),
                ),
                child: Center(
                  child: Text(
                    'hiDoc',
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ARTICLES',
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TopCardWidget(
                      articleDescription:
                          controller.singleEvent.value?.article.articleImg ??
                              '',
                      articleTitle:
                          controller.singleEvent.value?.article.articleTitle ??
                              'No Title',
                      imageUrl: controller
                              .singleEvent.value?.article.articleDescription ??
                          'No Description',
                    ),
                    if (kIsWeb) ...[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: HidocBulletin(
                              articleModel: controller
                                  .singleEvent.value!.trandingBulletin,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: TrendingBulletin(
                                article: controller
                                    .singleEvent.value!.trandingBulletin,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ] else ...[
                      HidocBulletin(
                        articleModel:
                            controller.singleEvent.value!.trandingBulletin,
                      ),
                      SizedBox(height: 16),
                      TrendingBulletin(
                        article: controller.singleEvent.value!.trandingBulletin,
                      ),
                    ],
                    if (kIsWeb) ...[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ArticleWidget(
                              title: 'Trending Article',
                              article:
                                  controller.singleEvent.value!.trandingArticle,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: ArticleWidget(
                              article:
                                  controller.singleEvent.value!.exploreArticle,
                              title: 'Explore More Article',
                            ),
                          ),
                        ],
                      ),
                    ] else ...[
                      ArticleWidget(
                        title: 'Trending Article',
                        article: controller.singleEvent.value!.trandingArticle,
                      ),
                      ArticleWidget(
                        article: controller.singleEvent.value!.exploreArticle,
                        title: 'Explore More Article',
                      ),
                    ],
                    NewsWidget(news: controller.singleEvent.value!.news,)
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
