// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'news_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Articles _$ArticlesFromJson(Map<String, dynamic> json) {
  return _Articles.fromJson(json);
}

/// @nodoc
mixin _$Articles {
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get urlToImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticlesCopyWith<Articles> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlesCopyWith<$Res> {
  factory $ArticlesCopyWith(Articles value, $Res Function(Articles) then) =
      _$ArticlesCopyWithImpl<$Res>;
  $Res call({String? title, String? description, String? urlToImage});
}

/// @nodoc
class _$ArticlesCopyWithImpl<$Res> implements $ArticlesCopyWith<$Res> {
  _$ArticlesCopyWithImpl(this._value, this._then);

  final Articles _value;
  // ignore: unused_field
  final $Res Function(Articles) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? urlToImage = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      urlToImage: urlToImage == freezed
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ArticlesCopyWith<$Res> implements $ArticlesCopyWith<$Res> {
  factory _$ArticlesCopyWith(_Articles value, $Res Function(_Articles) then) =
      __$ArticlesCopyWithImpl<$Res>;
  @override
  $Res call({String? title, String? description, String? urlToImage});
}

/// @nodoc
class __$ArticlesCopyWithImpl<$Res> extends _$ArticlesCopyWithImpl<$Res>
    implements _$ArticlesCopyWith<$Res> {
  __$ArticlesCopyWithImpl(_Articles _value, $Res Function(_Articles) _then)
      : super(_value, (v) => _then(v as _Articles));

  @override
  _Articles get _value => super._value as _Articles;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? urlToImage = freezed,
  }) {
    return _then(_Articles(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      urlToImage: urlToImage == freezed
          ? _value.urlToImage
          : urlToImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Articles implements _Articles {
  _$_Articles({this.title, this.description, this.urlToImage});

  factory _$_Articles.fromJson(Map<String, dynamic> json) =>
      _$$_ArticlesFromJson(json);

  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? urlToImage;

  @override
  String toString() {
    return 'Articles(title: $title, description: $description, urlToImage: $urlToImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Articles &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.urlToImage, urlToImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(urlToImage));

  @JsonKey(ignore: true)
  @override
  _$ArticlesCopyWith<_Articles> get copyWith =>
      __$ArticlesCopyWithImpl<_Articles>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArticlesToJson(this);
  }
}

abstract class _Articles implements Articles {
  factory _Articles(
      {final String? title,
      final String? description,
      final String? urlToImage}) = _$_Articles;

  factory _Articles.fromJson(Map<String, dynamic> json) = _$_Articles.fromJson;

  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  String? get urlToImage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ArticlesCopyWith<_Articles> get copyWith =>
      throw _privateConstructorUsedError;
}
