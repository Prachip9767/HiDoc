import 'package:ecnhrf/ui/article/article_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleView extends GetView<ArticleController> {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(backgroundColor: Colors.white,),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: ListView.builder(itemBuilder: (context, index) =>  Text(
              controller.singleEvent.value?.news[index].title ?? 'No Title',
              style: context.textTheme.bodyMedium?.copyWith(color: Colors.red),
            ),itemCount: controller.singleEvent.value?.news.length,),
          ),
        ),
      );
    });
  }
}
