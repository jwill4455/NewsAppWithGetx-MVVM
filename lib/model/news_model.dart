import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';

part 'news_model.g.dart';

@freezed
class Articles with _$Articles {
  factory Articles(
      {required String title,
      required String? description,
      required String? urlToImage}) = _Articles;

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);
}


class NewsModel {
  List<Articles>? articles;

  NewsModel({this.articles});

  NewsModel.fromJson(Map<String, dynamic> json) {
       articles=(json['articles'] as List).map((e) => Articles.fromJson(e)).toList();
  }
}
