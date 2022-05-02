import 'package:dio/dio.dart';
import 'package:news_app/data/remote/response/news_list_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: '')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/everything')
  Future<NewsListResponse> searchNewsByTopicAndKey(
      @Query('q') String searchKey, @Query('sources') String topic);

  @GET('/top-headlines')
  Future<NewsListResponse> topHeadlines(@Query('country') String country);
}
