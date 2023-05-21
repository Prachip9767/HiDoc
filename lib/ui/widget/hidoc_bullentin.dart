import 'package:ecnhrf/data/article_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class HidocBulletin extends StatelessWidget {
  final List<News> articleModel;
  const HidocBulletin({super.key, required this.articleModel,});

  @override
  Widget build(BuildContext context) {
    return articleModel.isNotEmpty? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: articleModel.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(thickness: 10,color: Colors.blueAccent,endIndent: 200),
                  SizedBox(height: 8,),
                  Text(
                   articleModel[index].title,
                    style: context.textTheme.bodyMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    articleModel[index].description,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),

                  Text('Read more',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.cyan[400],
                        fontStyle: FontStyle.italic,
                      )),
                ],
              ),
            ),
          ),
        )
      ],
    ):const SizedBox.shrink();
  }
}
