import 'package:ecnhrf/data/article_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class TrendingBulletin extends StatelessWidget {
  List<Article> article;

  TrendingBulletin({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return article.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: kIsWeb ? 0 : 16),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.lightBlueAccent.withOpacity(0.2),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                      child: Text('Trending Hidoc Bulletin',
                          style: context.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w900, fontSize: 24)),
                    ),
                    SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: article.length,
                        itemBuilder: (context, index) => Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    article[index].articleTitle ?? '',
                                    style:
                                        context.textTheme.bodyMedium?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(article[index].articleDescription ?? '',
                                      style: context.textTheme.titleSmall),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  Text('Read more',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.cyan[400],
                                        fontStyle: FontStyle.italic,
                                      )),
                                ]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : SizedBox.shrink();
  }
}
