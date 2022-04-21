import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter_mvvm/model/news_model.dart';
import 'package:news_app_flutter_mvvm/viewmodel/news_viewmodel.dart';


class NewsDetail extends StatelessWidget {

  final Articles articles;
  NewsDetail({required this.articles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(articles.title!),
      ),
    );
  }
}

