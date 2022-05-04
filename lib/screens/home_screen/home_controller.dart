import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/data/remote/response/news_list_response.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/routes/app_routes.dart';
import 'package:news_app/services/loading_progress_service.dart';
import 'package:news_app/utils/base_controller.dart';
import 'package:news_app/utils/constant.dart';
import 'package:news_app/utils/styles/resources.dart';

import '../../utils/failure.dart';

class HomeController extends BaseController {
  final LoadingProgressService _loadingProgress = Get.find();
  final NewsRepository _newsRepository = Get.find();
  List<String> sourceList = Resources.sourceList;

  RxInt selectedChipIndex = 0.obs;
  RxList<ArticlesModel> articleList = RxList();
  String? _category;

  onSearch(String value) {
    if (value.isNotEmpty) {
      openNewsList(value);
    }
  }

  openNewsList(String searchKey) {
    Get.toNamed(Routes.newsListScreen,
        arguments: {PARAMS_SEARCH_KEY: searchKey});
  }

  onTapNewsCard(ArticlesModel item) {}

  onTapChipNewsCategory(int index) {
    selectedChipIndex(index);
    _category = sourceList[index];

    // getCategoryData();
  }

  getHomeData() async {
    _loadingProgress.show();

    final responseList = await Future.wait([
      breakingNewsList(),
      newsByCategory(_category ?? ''),
    ]);
    // await _loadingProgress.hide();
    // _response.fold((l) {
    //   Get.log(l.message);
    // }, (r) {
    //   Get.log('${r.status}');
    //   articleList.value = r.articles ?? [];
    // });

    if (responseList[0] != null) {
      final breakingNewsResponse = responseList[0];
      articleList.value = breakingNewsResponse?.articles ?? [];
    }

    if (responseList[1] != null) {
      final breakingNewsResponse = responseList[0];
      articleList.value = breakingNewsResponse?.articles ?? [];
    }
  }

  Future<NewsListResponse?> breakingNewsList() async {
    final response = await _newsRepository.newsByCategory(country: 'us');

    NewsListResponse? data;
    response.fold((l) => () => showError(l), (r) => data = r);
    return data;
  }

  Future<NewsListResponse?> newsByCategory(String category) async {
    final response =
        await _newsRepository.newsByCategory(country: 'us', category: category);

    NewsListResponse? data;
    response.fold((l) => () => showError(l), (r) => data = r);
    return data;
  }
}
