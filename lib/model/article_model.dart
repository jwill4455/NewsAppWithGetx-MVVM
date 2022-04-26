import 'package:news_app_flutter_mvvm/model/source_model.dart';

class Article {
  Source? source;
  String? title;
  String? description;
  String? urlToImage;
  String? url;

  Article(
      {
        required this.url,
      required this.source,
      required this.title,
      required this.description,
      required this.urlToImage
      }
      );
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        source: Source.fromJson(json['source']),
        title: json['title'],
        url: json['url'],
        description: json['description'],
        urlToImage: json['urlToImage']
    );
  }
}

class NewsModel {
  List<Article>? articles;

  NewsModel({this.articles});

  NewsModel.fromJson(Map<String, dynamic> json) {
    articles =
        (json['articles'] as List).map((e) => Article.fromJson(e)).toList();
  }

}
