import 'package:ecnhrf/data/article_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class TrendingBulletin extends StatelessWidget{
   List<Article> article;

   TrendingBulletin({super.key, required this.article});

   @override
  Widget build(BuildContext context) {
   return article.isNotEmpty? Padding(
       padding: const EdgeInsets.symmetric(horizontal: 16),
     child: Container(
       width: double.infinity,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(14),
               color: Colors.lightBlueAccent.withOpacity(0.4),
             ),
       child: Padding(
         padding: const EdgeInsets.symmetric(vertical: 16),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Padding(
               padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
               child: Text('Trending Hidoc Bulletin',
                   style: context.textTheme.titleLarge),
             ),
             const SizedBox(height: 14,),
             SizedBox(
               child: ListView.builder(
                 shrinkWrap: true,
                 physics: const NeverScrollableScrollPhysics(),
                 itemCount: article.length,
                 itemBuilder: (context, index) => Container(
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 16),
                     child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                               article[index]
                                   .articleTitle ??
                                   '',
                               style: context.textTheme.titleMedium),
                           const SizedBox(
                             height: 12,
                           ),
                           Text(
                               article[index]
                                   .articleDescription ??
                                   '',
                               style: context.textTheme.titleSmall),
                         ]),
                   ),
                 ),
               ),
             ),
           ],
         ),
       ),
     ),
   ):SizedBox.shrink();

  }

}