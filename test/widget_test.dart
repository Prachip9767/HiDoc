import 'package:ecnhrf/routes_and_pages/routs_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
