import 'package:flutter/material.dart';
import 'package:news_app_flutter_mvvm/model/news_model.dart';


class NewsDetail extends StatelessWidget {

  final Articles articles;
  NewsDetail({required this.articles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(articles.title.toString()),
      ),
      body: Column(
        children: [
          Image.network(
            articles.urlToImage.toString(),
            fit: BoxFit.fill,
          ),
          Text(
            articles.description.toString(),
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

