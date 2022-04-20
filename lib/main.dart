import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter_mvvm/view/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black
          )
      ),
      home: HomeView(),
    );
  }
}
