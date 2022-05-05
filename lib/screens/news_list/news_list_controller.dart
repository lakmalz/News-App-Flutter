import 'package:get/get.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/data/remote/response/news_list_response.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/routes/app_routes.dart';
import 'package:news_app/services/loading_progress_service.dart';
import 'package:news_app/utils/base_controller.dart';
import 'package:news_app/utils/constant.dart';
import 'package:news_app/utils/page_helper.dart';
import 'package:news_app/utils/styles/resources.dart';
import 'package:intl/intl.dart';

class NewsListController extends BaseController with PageHelper {
  final LoadingProgressService _loadingProgress = Get.find();
  final NewsRepository _newsRepository = Get.find();
  List<String> sourceListWithFilter = [
    Resources.labelFilter,
    ...Resources.sourceList
  ];
  final numberFormater = NumberFormat('#,###,###');
  RxList<ArticlesModel> articleList = RxList();
  Rxn<NewsListResponse> newsListResponse = Rxn();
  RxInt selectedChipIndex = 0.obs;
  RxString searchKey = ''.obs;
  RxString _sortBy = ''.obs;
  RxString searchResultCount = '0'.obs;
  String _category = Resources.labelFilter;

  @override
  void onInit() {
    searchKey.value = Get.arguments?[PARAMS_SEARCH_KEY];
    _category = Get.arguments?[PARAMS_SELECTED_CATEGORY];
    selectedChipIndex.value = sourceListWithFilter.indexOf(_category);
    dataListeners();
    super.onInit();
  }

  @override
  void onReady() {
    getData(true);
    super.onReady();
  }

  dataListeners() {
    ever(newsListResponse, (_) {
      searchResultCount.value =
          numberFormater.format(newsListResponse.value?.totalResults ?? 0);

      if (articleList.isEmpty) {
        articleList(newsListResponse.value?.articles ?? []);
      } else {
        articleList.addAll(newsListResponse.value?.articles ?? []);
      }
    });
  }

  Future getData(bool isInitialLoading) async {
    if (_category == Resources.labelFilter) {
      await searchByKeyLanguage(
          searchKey.value, 'en', _sortBy.value, page, isInitialLoading);
    } else {
      await getNewsByCategory(
          'us', searchKey.value, _category ?? '', page, isInitialLoading);
    }
  }

  // Search news by passing search key word, language
  // and sortby few sort category
  Future searchByKeyLanguage(String searchKey, String language, String sortBy,
      int page, bool isInitialLoading) async {
    _loadingProgress.show(isVisible: isInitialLoading);
    final _response = await _newsRepository
        .searchByKeyLanguage(searchKey, language, sortBy, page: page);
    await _loadingProgress.hide();
    _response.fold((l) {
      showError(l);
    }, (r) {
      pageIncrement(r.totalResults ?? 0);
      newsListResponse.value = r;
    });
  }

  // Get news by category and search key for user entered country
  Future getNewsByCategory(String country, String searchKey, String category,
      int page, bool isInitialLoading) async {
    _loadingProgress.show(isVisible: isInitialLoading);
    final _response = await _newsRepository.newsByCategory(
        country: country, category: category, searchKey: searchKey, page: page);
    await _loadingProgress.hide();
    _response.fold((l) {
      showError(l);
    }, (r) {
      pageIncrement(r.totalResults ?? 0);
      newsListResponse.value = r;
    });
  }

  onTapNewsCard(ArticlesModel item) {
    Get.toNamed(Routes.newsDetailsScreen, arguments: {
      PARAMS_SELECTED_ARTICLE: item,
    });
  }

  onTapChipNewsCategory(int index) {
    resetPage();
    selectedChipIndex(index);
    _category = sourceListWithFilter[index];
    getData(true);
  }

  isNewsAvailable() => articleList.isNotEmpty;

  isLoading() => _loadingProgress.isVisible;

  onLoading() async {
    await getData(false);
  }

  onRefresh() async {
    refreshController.loadComplete();
    resetPage();
    await getData(false);
    refreshController.refreshCompleted();
  }

  resetPage() {
    page = 1;
    articleList.value = [];
  }
}
