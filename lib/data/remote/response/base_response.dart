import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/utils/constant.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  BaseResponse();

  String? status;
  String? message;
  int? totalResults;

  bool isSuccess() => status == statusOK;

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
