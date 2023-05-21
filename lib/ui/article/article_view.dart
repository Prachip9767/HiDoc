import 'package:ecnhrf/data/article_model.dart';
import 'package:ecnhrf/ui/article/article_controller.dart';
import 'package:ecnhrf/ui/static_widgets/static_wigets.dart';
import 'package:ecnhrf/ui/widget/articles_widget.dart';
import 'package:ecnhrf/ui/widget/bar_container.dart';
import 'package:ecnhrf/ui/widget/news_widget.dart';
import 'package:ecnhrf/ui/widget/offer_widget.dart';
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
            appBar: AppBar(
              backgroundColor: Colors.grey[100],
              elevation: 0,
              toolbarHeight: 30,
            ),
            backgroundColor: Colors.grey[100],
            body: Center(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double maxWidth = constraints.maxWidth;
                  return SizedBox(
                    width: kIsWeb
                        ? (maxWidth > 1000 ? 1000 : maxWidth)
                        : double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const TopLogo(),
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
                        BarContainer(),
                        const SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TopCardWidget(
                                  articleDescription: controller.singleEvent
                                          .value?.article.articleImg ??
                                      '',
                                  articleTitle: controller.singleEvent.value
                                          ?.article.articleTitle ??
                                      'No Title',
                                  imageUrl: controller.singleEvent.value
                                          ?.article.articleDescription ??
                                      'No Description',
                                  articlePublishedDate: controller
                                      .singleEvent.value?.article.createdAt,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                if (kIsWeb) ...[
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 32),
                                          child: Container(
                                            color:
                                                Colors.white.withOpacity(0.4),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 16, top: 16),
                                                  child: Text(
                                                    'HIDOC BULETTIN',
                                                    style: context
                                                        .textTheme.bodyLarge
                                                        ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      letterSpacing: 1,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 24,
                                                ),
                                                HidocBulletin(
                                                  articleModel: controller
                                                      .singleEvent.value!.news,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 16),
                                          child: TrendingBulletin(
                                            article: controller.singleEvent
                                                .value!.trandingBulletin,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ] else ...[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, top: 16),
                                    child: Text(
                                      'HIDOC BULETTIN',
                                      style:
                                          context.textTheme.bodyLarge?.copyWith(
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black,
                                        fontSize: 18,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  HidocBulletin(
                                    articleModel:
                                        controller.singleEvent.value!.news,
                                  ),
                                  const SizedBox(height: 16),
                                  TrendingBulletin(
                                    article: controller
                                        .singleEvent.value!.trandingBulletin,
                                  ),
                                ],
                                const ReadMoreButton(
                                  padding: 18,
                                  title: 'Read more bulletins',
                                ),
                                if (kIsWeb) ...[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: ArticleWidget(
                                          title: 'Trending Article',
                                          article: controller.singleEvent.value!
                                              .trandingArticle,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            ArticleWidget(
                                              article: controller.singleEvent
                                                  .value!.exploreArticle,
                                              title: 'Explore More Article',
                                            ),
                                            const ReadMoreButton(
                                              padding: 0,
                                              title: 'Explore Hidoc Dr',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  )
                                ] else ...[
                                  ArticleWidget(
                                    title: 'Trending Article',
                                    article: controller
                                        .singleEvent.value!.trandingArticle,
                                  ),
                                  ArticleWidget(
                                    article: controller
                                        .singleEvent.value!.exploreArticle,
                                    title: 'Explore More Article',
                                  ),
                                  const ReadMoreButton(
                                    padding: 0,
                                    title: 'Explore Hidoc Dr',
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  )
                                ],
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  width: double.maxFinite,
                                  color: Colors.white,
                                  child: Column(children: [
                                    Text(
                                      'Whats More On HiDoc Dr.',
                                      style: context.textTheme.labelLarge
                                          ?.copyWith(
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              fontSize: 24,
                                              fontWeight: FontWeight.w900),
                                    ),
                                    if (kIsWeb) ...[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: NewsWidget(
                                              news: controller
                                                  .singleEvent.value!.bulletin,
                                              context: context,
                                            ),
                                          ),
                                          Expanded(
                                              child: OfferWidget(
                                            context: context,
                                          ))
                                        ],
                                      ),
                                    ],
                                    if (!kIsWeb) ...[
                                      NewsWidget(
                                        news: controller
                                            .singleEvent.value!.bulletin,
                                        context: context,
                                      ),
                                      OfferWidget(
                                        context: context,
                                      )
                                    ],
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ));
      }
    });
  }
}
