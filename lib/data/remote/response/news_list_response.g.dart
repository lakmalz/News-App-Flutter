// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsListResponse _$NewsListResponseFromJson(Map<String, dynamic> json) =>
    NewsListResponse()
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..totalResults = json['totalResults'] as int?
      ..articles = (json['articles'] as List<dynamic>?)
          ?.map((e) => ArticlesModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$NewsListResponseToJson(NewsListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
