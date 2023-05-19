import 'package:ecnhrf/data/article_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class HidocBulletin extends StatelessWidget {
  final List<Article> articleModel;
  const HidocBulletin({super.key, required this.articleModel,});

  @override
  Widget build(BuildContext context) {
    return articleModel.isNotEmpty? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: Text(
            'HIDOC BULETTIN',
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w800,
              color: Colors.black,
              fontSize: 18,
              letterSpacing: 1,
            ),
          ),
        ),
        SizedBox(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: articleModel.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                   articleModel[index].articleTitle,
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    articleModel[index].articleDescription,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ):const SizedBox.shrink();
  }
}
