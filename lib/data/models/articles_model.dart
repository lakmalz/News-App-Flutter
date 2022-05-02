import 'package:json_annotation/json_annotation.dart';

part 'articles_model.g.dart';

@JsonSerializable()
class ArticlesModel {

  ArticlesModel();

  factory ArticlesModel.fromJson(Map<String, dynamic> json) => _$ArticlesModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArticlesModelToJson(this);
}