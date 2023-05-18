import 'package:ecnhrf/ui/article/article_binding.dart';
import 'package:ecnhrf/ui/article/article_view.dart';
import 'package:get/get.dart';
class ArticlePages{
  ArticlePages._();

  static const initial =ArticleRoutes.articleHome ;

  static final routes = <GetPage>[
    GetPage(
        name: ArticleRoutesPaths.articleHome,
        page: () =>ArticleView(),
        binding:ArticleBindings()
    ),
  ];
}

abstract class ArticleRoutes {
  ArticleRoutes._();
  static const articleHome = ArticleRoutesPaths.articleHome;

}

abstract class ArticleRoutesPaths {
  static const articleHome = '/';


}