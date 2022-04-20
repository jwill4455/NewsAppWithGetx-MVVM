// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Articles _$$_ArticlesFromJson(Map<String, dynamic> json) => _$_Articles(
      title: json['title'] as String?,
      description: json['description'] as String?,
      urlToImage: json['urlToImage'] as String?,
    );

Map<String, dynamic> _$$_ArticlesToJson(_$_Articles instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'urlToImage': instance.urlToImage,
    };
