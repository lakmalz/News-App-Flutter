import 'package:get/get.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/data/remote/response/news_list_response.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/routes/app_routes.dart';
import 'package:news_app/services/loading_progress_service.dart';
import 'package:news_app/utils/base_controller.dart';
import 'package:news_app/utils/constant.dart';
import 'package:news_app/utils/styles/resources.dart';
import 'package:intl/intl.dart';

class NewsListController extends BaseController {
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
  String? _category;

  @override
  void onInit() {
    searchKey.value = Get.arguments?[PARAMS_SEARCH_KEY];
    ever(newsListResponse, (_) {
      searchResultCount.value = numberFormater.format(newsListResponse.value?.totalResults ?? 0);
      articleList(newsListResponse.value?.articles ?? []);
    });
    super.onInit();
  }

  @override
  void onReady() {
    getFilterData();
    super.onReady();
  }

  getFilterData() {
    //TODO en use for testing purpose
    searchByKeyLanguage(searchKey.value, 'en', _sortBy.value);
  }

  getCategoryData() {
    // TODO us for testing purpose
    getNewsByCategory('us', searchKey.value, _category ?? '');
  }

  // Search news by passing search key word, language
  // and sortby few sort category
  searchByKeyLanguage(String searchKey, String language, sortBy) async {
    _loadingProgress.show();
    final _response =
        await _newsRepository.searchByKeyLanguage(searchKey, language, sortBy);
    await _loadingProgress.hide();
    _response.fold((l) {
      showError(l);
    }, (r) {
      newsListResponse.value = r;
    });
  }

  // Get news by category and search key for user entered country
  getNewsByCategory(String country, String searchKey, String category) async {
    _loadingProgress.show();
    articleList([]);
    final _response = await _newsRepository.newsByCategory(
        country: country, category: category, searchKey: searchKey);
    await _loadingProgress.hide();
    _response.fold((l) {
      showError(l);
    }, (r) {
      newsListResponse.value = r;
    });
  }

  onTapNewsCard(ArticlesModel item) {
    Get.toNamed(Routes.newsDetailsScreen, arguments: {
      PARAMS_SELECTED_ARTICLE: item,
    });
  }

  onTapChipNewsCategory(int index) {
    selectedChipIndex(index);
    _category = sourceListWithFilter[index];
    if (_category != Resources.labelFilter) {
      getCategoryData();
    }
  }

  isNewsAvailable() => articleList.isNotEmpty;

  isLoading() => _loadingProgress.isVisible;
}
