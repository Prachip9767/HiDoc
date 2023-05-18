import 'package:ecnhrf/ui/article/article_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleView extends GetView<ArticleController> {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: 50,
        child: Column(
          children: [
            const Icon(
              Icons.add,
              size: 80,
              color: Colors.red,
            ),
            Text(
              controller.singleEvent.value?.news[0].title ?? 'No Title',
              style: context.textTheme.bodyMedium?.copyWith(color: Colors.red),
            ),

          ],
        ),
      );
    });
    //   Container(
    //   height: 500,
    //   color: Colors.lightBlue,
    //   child: Column(
    //     children: [
    //       Text(controller.singleEvent.value?.specialityName ?? '',
    //       style:context.textTheme.bodyMedium?.copyWith(color: Colors.white),),
    //     ],
    //   ),
    // );
  }
}
