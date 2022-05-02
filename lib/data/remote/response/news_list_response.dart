import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/data/remote/response/base_response.dart';

part 'news_list_response.g.dart';

@JsonSerializable()
class NewsListResponse extends BaseResponse{
  NewsListResponse();

  List<ArticlesModel>? articles;

  factory NewsListResponse.fromJson(Map<String, dynamic> json) => _$NewsListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NewsListResponseToJson(this);
}
