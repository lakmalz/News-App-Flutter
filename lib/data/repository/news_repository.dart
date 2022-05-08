import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:news_app/data/remote/api_client.dart';
import 'package:news_app/data/remote/response/news_list_response.dart';
import 'package:news_app/utils/constant.dart';
import 'package:news_app/utils/failure.dart';
import 'package:news_app/utils/styles/resources.dart';

class NewsRepository {
  final ApiClient _apiClient = Get.find();

  Future<Either<Failure, NewsListResponse>> everything(
      {String searchKey = '',
      String langauge = 'en',
      required int page}) async {
    try {
      final response =
          await _apiClient.everything(searchKey, langauge, page, pageSize);

      if (response.isSuccess()) {
        return Right(response);
      } else {
        return Left(Failure.init(
            title: Resources.error, message: response.message ?? ''));
      }
    } catch (e) {
      return Left(Failure.init(error: e));
    }
  }

  Future<Either<Failure, NewsListResponse>> topHeadlines(
      {String country = '',
      String category = '',
      String language = Resources.defaultLanguage,
      String searchKey = '',
      int page = 1}) async {
    try {
      final response = await _apiClient.topHeadlines(
          country, category, language , searchKey, page, pageSize);

      if (response.isSuccess()) {
        return Right(response);
      } else {
        return Left(Failure.init(
            title: Resources.error, message: response.message ?? ''));
      }
    } catch (e) {
      return Left(Failure.init(error: e));
    }
  }
}
