import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:news_app/data/remote/api_client.dart';
import 'package:news_app/data/remote/response/news_list_response.dart';
import 'package:news_app/utils/failure.dart';

class NewsRepository {
  final ApiClient _apiClient = Get.find();

  Future<Either<Failure, NewsListResponse>> searchNewsByTopicAndKey(
      String searchKey, String topic) async {
    try {
      final response =
          await _apiClient.searchNewsByTopicAndKey(searchKey, topic);

      if (response.isSuccess()) {
        return Right(response);
      } else {
        return Left(Failure.init(title: error, message: response.message ?? ''));
      }
      
    } catch (e) {
      return Left(Failure.init(error: e));
    }
  }

  Future<Either<Failure, NewsListResponse>> topHeadlines(String country) async {
    try {
      final response = await _apiClient.topHeadlines(country);
          
      if (response.isSuccess()) {
        return Right(response);
      } else {
        return Left(Failure.init(title: error, message: response.message ?? ''));
      }
    } catch (e) {
      return Left(Failure.init(error: e));
    }
  }
}
