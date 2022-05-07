import 'package:get/get.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/data/remote/response/news_list_response.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/routes/app_routes.dart';
import 'package:news_app/utils/base_controller.dart';
import 'package:news_app/utils/constant.dart';
import 'package:news_app/utils/page_helper.dart';
import 'package:news_app/utils/styles/resources.dart';

class HomeController extends BaseController with PageHelper {
  final NewsRepository _newsRepository = Get.find();
  List<String> sourceList = Resources.sourceList;

  RxInt selectedChipIndex = 0.obs;
  RxList<ArticlesModel> breakingNewsList = RxList();
  RxList<ArticlesModel> articleList = RxList();
  String? _category = Resources.sourceList[0];

  @override
  void onReady() {
    loadData(true);
    super.onReady();
  }

  onSearch(String value) {
    if (value.isNotEmpty) {
      navigateToNewsList(value);
    }
  }

  navigateToNewsList(String searchKey) {
    Get.toNamed(Routes.newsListScreen, arguments: {
      paramsSearchKey: searchKey,
      paramsSelectedCategory: _category
    });
  }

  onTapNewsCard(ArticlesModel item) {
    Get.toNamed(Routes.newsDetailsScreen, arguments: {
      paramsSelectedArticle: item,
    });
  }

  onTapChipNewsCategory(int index) {
    selectedChipIndex(index);
    _category = sourceList[index];
    resetPage();
    loadNewsByCategory(true);
  }

  // Initial home data get from cloud API
  loadData(bool initialLoading) async {
    loadingProgress.show(isVisible: initialLoading);

    // Multiple requests sending at a time
    final responseList = await Future.wait([
      getBreakingNewsList(),
      getNewsByCategory(_category ?? '', page),
    ]);

    loadingProgress.hide();

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

  loadNewsByCategory(bool initialLoading) async {
    loadingProgress.show(isVisible: initialLoading);

    final response = await getNewsByCategory(_category ?? '', page);
    await loadingProgress.hide();
    pageIncrement(response?.totalResults ?? 0);

    if (articleList.isEmpty) {
      articleList(response?.articles ?? []);
    } else {
      articleList.addAll(response?.articles ?? []);
    }
  }

  Future<NewsListResponse?> getBreakingNewsList() async {
    //TODO
    final response = await _newsRepository.newsByCategory(country: 'us');

    NewsListResponse? data;
    response.fold((l) => showError(l), (r) => data = r);
    return data;
  }

  Future<NewsListResponse?> getNewsByCategory(String category, int page) async {
    final response = await _newsRepository.newsByCategory(
        country: 'us', category: category, page: page);

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
}
