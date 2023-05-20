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
      if (controller.isLoading.value) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          body: Center(
            child: Container(
              width: kIsWeb ? 900 : double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 14, bottom: 14),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      height: 40,
                      width: 150,
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
                  ),
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
                  SizedBox(height: 16,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:16),
                    child: Container(
                      width: 600,
                      height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Spacer(),
                            SizedBox(width: 50,),
                            Text(
                              'Criticle Care',
                              style: context.textTheme.labelLarge,
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Icon(Icons.arrow_drop_down_outlined),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TopCardWidget(
                            articleDescription: controller
                                    .singleEvent.value?.article.articleImg ??
                                '',
                            articleTitle: controller
                                    .singleEvent.value?.article.articleTitle ??
                                'No Title',
                            imageUrl: controller.singleEvent.value?.article
                                    .articleDescription ??
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
                                const SizedBox(width: 16),
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
                            const SizedBox(height: 16),
                            TrendingBulletin(
                              article:
                                  controller.singleEvent.value!.trandingBulletin,
                            ),
                          ],
                          if (kIsWeb) ...[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ArticleWidget(
                                    title: 'Trending Article',
                                    article: controller
                                        .singleEvent.value!.trandingArticle,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: ArticleWidget(
                                    article: controller
                                        .singleEvent.value!.exploreArticle,
                                    title: 'Explore More Article',
                                  ),
                                ),
                              ],
                            ),
                          ] else ...[
                            ArticleWidget(
                              title: 'Trending Article',
                              article:
                                  controller.singleEvent.value!.trandingArticle,
                            ),
                            ArticleWidget(
                              article:
                                  controller.singleEvent.value!.exploreArticle,
                              title: 'Explore More Article',
                            ),
                          ],
                          NewsWidget(
                            news: controller.singleEvent.value!.news,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
