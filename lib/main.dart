import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'routes_and_pages/routs_pages.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX news app',
      theme: ThemeData(),
      getPages: ArticlePages.routes,
      initialRoute:ArticlePages.initial,
    );
  }
}
