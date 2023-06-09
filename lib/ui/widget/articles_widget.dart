import 'package:ecnhrf/data/article_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class ArticleWidget extends StatelessWidget{
  final String title;
  final List<Article> article;
  const ArticleWidget({super.key,required this.article,required this.title});

  @override
  Widget build(BuildContext context) {
   return article.isNotEmpty?
     Padding(
       padding: const EdgeInsets.all(16.0),
       child: Container(
           decoration: BoxDecoration(
             border: Border.all(
                 color: Colors.grey[400]!, width: 2),
           ),
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Text(title,
                     style: context.textTheme.titleLarge),
                 ListView.builder(
                     shrinkWrap: true,
                     physics: const NeverScrollableScrollPhysics(),
                     itemCount: article.length,
                     itemBuilder: (context, index) => Column(
                       crossAxisAlignment:
                       CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Divider(height: 4, color:Colors.grey[600]),
                         Padding(
                           padding: const EdgeInsets.all(4.0),
                           child: Text(article[index].articleTitle,
                             style: context.textTheme.titleMedium
                                 ?.copyWith(
                                 color: Colors.black
                                     .withOpacity(0.9),
                                 fontSize: 14),
                           ),
                         ),
                       ],
                     )),
               ],
             ),
           )),
     ):SizedBox();
  }

}