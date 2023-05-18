import 'package:ecnhrf/ui/article/article_controller.dart';
import 'package:get/get.dart';
class ArticleBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ArticleController>(() => ArticleController());  }

}