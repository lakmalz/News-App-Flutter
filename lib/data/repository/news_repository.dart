import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:news_app/data/remote/api_client.dart';
import 'package:news_app/data/remote/response/news_list_response.dart';
import 'package:news_app/utils/constant.dart';
import 'package:news_app/utils/failure.dart';

class NewsRepository {
  final ApiClient _apiClient = Get.find();

  Future<Either<Failure, NewsListResponse>> searchByKeyLanguage(
      String searchKey, String langauge, String sortBy,
      {required int page}) async {
    try {
      final response = await _apiClient.searchByKeyLanguage(
          searchKey, langauge, sortBy, page, pageSize);

      if (response.isSuccess()) {
        return Right(response);
      } else {
        return Left(
            Failure.init(title: error, message: response.message ?? ''));
      }
    } catch (e) {
      return Left(Failure.init(error: e));
    }
  }

  Future<Either<Failure, NewsListResponse>> newsByCategory(
      {required String country,
      String category = '',
      String searchKey = '',
      int page = 1}) async {
    try {
      final response = await _apiClient.topHeadline(
          country, category, searchKey, page, pageSize);

      if (response.isSuccess()) {
        return Right(response);
      } else {
        return Left(
            Failure.init(title: error, message: response.message ?? ''));
      }
    } catch (e) {
      return Left(Failure.init(error: e));
    }
  }
}
