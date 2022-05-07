import 'package:dio/dio.dart';
import 'package:news_app/data/remote/response/news_list_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: '')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/everything')
  Future<NewsListResponse> searchByKeyLanguage(
    @Query('q') String searchKey,
    @Query('language')String language,
    @Query('page') int page,
    @Query('pageSize') int pageSize,
  );

  @GET('/top-headlines')
  Future<NewsListResponse> topHeadline(
    @Query('country') String country,
    @Query('category') String category,
    @Query('language')String language,
    @Query('q') String key,
    @Query('page') int page,
    @Query('pageSize') int pageSize,
  );
}
