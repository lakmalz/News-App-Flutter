import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/data/remote/response/news_list_response.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/data/repository/settings_preference_repository.dart';
import 'package:news_app/modules/news_list/components/filter_bottomsheet.dart';
import 'package:news_app/routes/app_routes.dart';
import 'package:news_app/services/loading_progress_service.dart';
import 'package:news_app/modules/base/base_controller.dart';
import 'package:news_app/utils/constant.dart';
import 'package:news_app/utils/enum.dart';
import 'package:news_app/utils/extension.dart';
import 'package:news_app/utils/page_helper.dart';
import 'package:news_app/utils/styles/resources.dart';
import 'package:intl/intl.dart';

class NewsListController extends BaseController with PageHelper {
  final NewsRepository _newsRepository = Get.find();
  final UserPreferencesRepository _userPrefRepository = Get.find();
  late List<String> sourceListWithFilter = [
    Resources.labelFilter,
    ...Resources.sourceList
  ];
  final numberFormater = NumberFormat('#,###,###');
  RxList<ArticlesModel> articleList = RxList();
  Rxn<NewsListResponse> newsListResponse = Rxn();
  RxInt selectedChipIndex = 0.obs;
  RxString searchKey = ''.obs;
  String? _selectedCountry;
  String? _selectedLanguage;
  RxString searchResultCount = '0'.obs;
  RxString searchByString = ''.obs;
  RxString selectedCategory = Resources.labelFilter.obs;
  eRequestType? requestType;

  @override
  Future<void> onInit() async {
    requestType = Get.arguments?[paramsRequestType];
    searchKey.value = Get.arguments?[paramsSearchKey];
    selectedCategory.value = Get.arguments?[paramsSelectedCategory];
    // setNewsCategoryChiplist();
    selectedChipIndex.value =
        sourceListWithFilter.indexOf(selectedCategory.value);
    _selectedCountry = await _userPrefRepository.readFilterCountry();
    _selectedLanguage = await _userPrefRepository.readFilterLanguage();
    dataListeners();
    super.onInit();
  }

  @override
  void onReady() {
    initialDataLoad();
    super.onReady();
  }

  // setNewsCategoryChiplist() {
  //   if (requestType == eRequestType.search) {
  //     sourceListWithFilter = [...Resources.sourceList];
  //   } else {
  //     sourceListWithFilter = [Resources.labelFilter, ...Resources.sourceList];
  //   }
  // }

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
    if (isFilterCategory()) {
      if (searchKey.value.isNotEmpty) {
        await searchByFilterValues(
            searchKey.value,
            _selectedLanguage ?? Resources.defaultLanguage,
            page,
            isInitialLoading);
      } else {
        await getNewsByCategory(_selectedCountry ?? '', _selectedLanguage ?? '',
            searchKey.value, selectedCategory.value, page, isInitialLoading);
      }
    } else {
      await getNewsByCategory(_selectedCountry ?? '', _selectedLanguage ?? '',
          searchKey.value, selectedCategory.value, page, isInitialLoading);
    }
  }

  // Search news by passing search key word, language
  Future searchByFilterValues(String searchKey, String language, int page,
      bool isInitialLoading) async {
        searchByString.value = '';
    loading.show(isVisible: isInitialLoading);
    final _response = await _newsRepository.everything(
        searchKey: searchKey, langauge: language, page: page);
    await loading.hide();
    _response.fold((l) {
      showError(l);
    }, (r) {
      searchByString.value = [searchKey].where((element) => element.isNotEmpty ).join(', ');
      pageIncrement(r.totalResults ?? 0);
      newsListResponse.value = r;
    });
  }

  // Get news by category and search key for user entered country
  Future getNewsByCategory(
      String country,
      String language,
      String searchKeyWord,
      String catgory,
      int page,
      bool isInitialLoading) async {
        searchByString.value = '';
    loading.show(isVisible: isInitialLoading);
    final _response = await _newsRepository.topHeadlines(
        country: country,
        category: catgory == Resources.labelFilter ? '' : catgory,
        language: language,
        searchKey: searchKeyWord,
        page: page);
    await loading.hide();
    _response.fold((l) {
      showError(l);
    }, (r) {
      pageIncrement(r.totalResults ?? 0);
      searchByString.value = [searchKeyWord, catgory].where((element) => element.isNotEmpty ).join(', ');
      newsListResponse.value = r;
    });
  }

  onTapNewsCard(ArticlesModel item) {
    Get.toNamed(Routes.newsDetailsScreen, arguments: {
      paramsSelectedArticle: item,
    });
  }

  onTapChipNewsCategory(int index, BuildContext context) {
    selectedCategory.value = sourceListWithFilter[index];
    selectedChipIndex(index);
    if (isFilterCategory()) {
      resetPage();
      openFilterBottomSheet(context);
    } else {
      initialDataLoad();
    }
  }

  isNewsAvailable() => articleList.isNotEmpty;

  isLoading() => loading.isVisible;

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

  initialDataLoad() {
    resetPage();
    getData(true);
  }

  onSubmitSearchTextField(String value) {
    searchKey.value = value;
    initialDataLoad();
  }

  isFilterCategory() => selectedCategory.value == Resources.labelFilter;

  void openFilterBottomSheet(BuildContext context) {
    context.showModal(FilterBottomSheet(
      selectedCountryKey: _selectedCountry,
      selectedLanguageKey: _selectedLanguage,
      onTapSave: (countryKey, languageKey) async {
        _selectedCountry = countryKey;
        _selectedLanguage = languageKey;
        _userPrefRepository.saveFilterCountry(countryKey ?? '');
        _userPrefRepository.saveFilterLanguage(languageKey ?? '');
        initialDataLoad();
      },
    ));
  }
}
