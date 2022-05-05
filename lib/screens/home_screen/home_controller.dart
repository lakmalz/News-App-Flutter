import 'package:get/get.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/data/remote/response/news_list_response.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/routes/app_routes.dart';
import 'package:news_app/services/loading_progress_service.dart';
import 'package:news_app/utils/base_controller.dart';
import 'package:news_app/utils/constant.dart';
import 'package:news_app/utils/styles/resources.dart';

class HomeController extends BaseController {
  final LoadingProgressService _loadingProgress = Get.find();
  final NewsRepository _newsRepository = Get.find();
  List<String> sourceList = Resources.sourceList;

  RxInt selectedChipIndex = 0.obs;
  RxList<ArticlesModel> breakingNewsList = RxList();
  RxList<ArticlesModel> articleList = RxList();
  String? _category = Resources.sourceList[0];

  @override
  void onReady() {
    loadHomeData();
    super.onReady();
  }

  onSearch(String value) {
    if (value.isNotEmpty) {
      openNewsList(value);
    }
  }

  openNewsList(String searchKey) {
    Get.toNamed(Routes.newsListScreen,
        arguments: {PARAMS_SEARCH_KEY: searchKey});
  }

  onTapNewsCard(ArticlesModel item) {
    Get.toNamed(Routes.newsDetailsScreen, arguments: {
      PARAMS_SELECTED_ARTICLE: item,
    });
  }

  onTapChipNewsCategory(int index) {
    selectedChipIndex(index);
    _category = sourceList[index];
    loadNewsByCategory();
  }

  // Initial home data loading
  loadHomeData() async {
    _loadingProgress.show();

    // Multiple requests sending at a time
    final responseList = await Future.wait([
      getBreakingNewsList(),
      getNewsByCategory(_category ?? ''),
    ]);

    _loadingProgress.hide();

    // Received Breaking news list asign to  Rx value
    if (responseList[0] != null) {
      final breakingNewsResponse = responseList[0];
      breakingNewsList.value = breakingNewsResponse?.articles ?? [];
    }

    // Received category news list asign to  Rx value
    if (responseList[1] != null) {
      final breakingNewsResponse = responseList[1];
      articleList.value = breakingNewsResponse?.articles ?? [];
    }
  }

  loadNewsByCategory() async {
    _loadingProgress.show();
    articleList.value = [];
    
    final response = await getNewsByCategory(_category ?? '');
    await _loadingProgress.hide();
    articleList.value = response?.articles ?? [];
  }

  Future<NewsListResponse?> getBreakingNewsList() async {
    final response = await _newsRepository.newsByCategory(country: 'us');

    NewsListResponse? data;
    response.fold((l) => () => showError(l), (r) => data = r);
    return data;
  }

  Future<NewsListResponse?> getNewsByCategory(String category) async {
    final response =
        await _newsRepository.newsByCategory(country: 'us', category: category);

    NewsListResponse? data;
    response.fold((l) => () => showError(l), (r) => data = r);
    return data;
  }
}
