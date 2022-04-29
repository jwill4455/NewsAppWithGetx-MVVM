import 'source_model.dart';

class Article {
  Source? source;
  String? title;
  String? description;
  String? urlToImage;
  String? url;

  Article(
      {
        this.url,
        this.source,
        this.title,
        this.description,
        this.urlToImage
      }
      );

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        source: Source.fromJson(json['source']),
        title: json['title'],
        url: json['url'],
        description: json['description'],
        urlToImage: json['urlToImage']);
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
