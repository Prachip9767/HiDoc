import 'package:ecnhrf/data/article_model.dart';
import 'package:ecnhrf/network/service_factory.dart';
import 'package:get/get.dart';

class ArticleController extends GetxController {
  final RxBool isLoading = true.obs;
  final Rx<ArticleModel?> singleEvent = Rx<ArticleModel?>(null);

  @override
  void onInit() {
    getData();
  }

  getData() async {
    try {
      isLoading.value = true;
      var description = await RemoteServices.fetchArticles();
      if (description != null) {
        singleEvent.value = description;
        print('event ${singleEvent.value}');
      }
    } finally {
      isLoading.value = false;
    }
  }
}
