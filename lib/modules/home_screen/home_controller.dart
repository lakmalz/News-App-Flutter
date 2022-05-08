import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/data/remote/response/news_list_response.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/modules/dashboard/dashboard_controller.dart';
import 'package:news_app/routes/app_routes.dart';
import 'package:news_app/modules/base/base_controller.dart';
import 'package:news_app/utils/constant.dart';
import 'package:news_app/utils/enum.dart';
import 'package:news_app/utils/page_helper.dart';
import 'package:news_app/utils/styles/resources.dart';

class HomeController extends BaseController with PageHelper {
  final DashboardController _dashboardController = Get.find();
  late ScrollController scrollController;
  final NewsRepository _newsRepository = Get.find();
  List<String> sourceList = Resources.sourceList;

  RxInt selectedChipIndex = 0.obs;
  RxList<ArticlesModel> breakingNewsList = RxList();
  RxList<ArticlesModel> articleList = RxList();
  String? _category = Resources.sourceList[0];


  @override
  void onInit() {
    scrollController = ScrollController()..addListener(_scrollListener);
    super.onInit();
  }

  @override
  void onReady() {
    loadData(true);//TODO remove this 
    super.onReady();
  }

  onSearch(String value) {
    if (value.isNotEmpty) {
      navigateToNewsList(eRequestType.search, searchKey: value);
    }
  }

  navigateToNewsList(eRequestType requestType, {String searchKey = ''}) {
    Get.toNamed(Routes.newsListScreen, arguments: {
      paramsRequestType: requestType,
      paramsSearchKey: searchKey,
      paramsSelectedCategory: _category
    });
  }

  onTapNewsCard(ArticlesModel item) {
    Get.toNamed(Routes.newsDetailsScreen, arguments: {
      paramsSelectedArticle: item,
    });
  }

  // onTap function for news category Chip button
  onTapChipNewsCategory(int index) {
    selectedChipIndex(index);
    _category = sourceList[index];
    resetPage();
    loadNewsByCategory(true);
  }

  // Initial home data get from cloud API
  loadData(bool initialLoading) async {
    loading.show(isVisible: initialLoading);

    // Multiple requests sending at a time
    final responseList = await Future.wait([
      getBreakingNewsList(),
      getTopNewsSection(_category ?? '', page),
    ]);

    loading.hide();

    // Received Breaking news list asign to  Rx value
    if (responseList[0] != null) {
      final breakingNewsResponse = responseList[0];
      breakingNewsList.value = breakingNewsResponse?.articles ?? [];
    }

    // Received category news list asign to  Rx value
    if (responseList[1] != null) {
      final newsResponse = responseList[1];
      pageIncrement(newsResponse?.totalResults ?? 0);
      articleList.value = newsResponse?.articles ?? [];
    }
  }

  // Load news by news category ex: Business, Health
  loadNewsByCategory(bool initialLoading) async {
    loading.show(isVisible: initialLoading);

    final response = await getTopNewsSection(_category ?? '', page);
    await loading.hide();
    pageIncrement(response?.totalResults ?? 0);

    if (articleList.isEmpty) {
      articleList(response?.articles ?? []);
    } else {
      articleList.addAll(response?.articles ?? []);
    }
  }

  // Get breaking news from API
  Future<NewsListResponse?> getBreakingNewsList() async {
    final response = await _newsRepository.topHeadlines(country: Resources.defaultCountry);

    NewsListResponse? data;
    response.fold((l) => showError(l), (r) => data = r);
    return data;
  }

  // Get news from API for selected category
  Future<NewsListResponse?> getTopNewsSection(String category, int page) async {
    final response = await _newsRepository.topHeadlines(category: category, page: page);

    NewsListResponse? data;
    response.fold((l) => showError(l), (r) => data = r);
    return data;
  }

  onLoading() async {
    await loadNewsByCategory(false);
  }
  
  onRefresh() async {
    refreshController.loadComplete();
    resetPage();
    await loadData(false);
    refreshController.refreshCompleted();
  }

  resetPage() {
    page = 1;
    articleList.value = [];
  }

  void _scrollListener() {
    scrollController.position.userScrollDirection == ScrollDirection.reverse
        ? _dashboardController.visibleBottomBar(false)
        : _dashboardController.visibleBottomBar(true);
  }
}
