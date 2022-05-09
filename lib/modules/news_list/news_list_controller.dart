import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/data/remote/response/news_list_response.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/data/repository/settings_preference_repository.dart';
import 'package:news_app/modules/news_list/components/filter_bottomsheet.dart';
import 'package:news_app/routes/app_routes.dart';
import 'package:news_app/modules/base/base_controller.dart';
import 'package:news_app/utils/constant.dart';
import 'package:news_app/utils/enum.dart';
import 'package:news_app/utils/extension.dart';
import 'package:news_app/utils/helper.dart';
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
  final thousandFormater = Helper().thousanFormater;
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
  onInit() {
    receivedArguments();
    initData();
    dataListeners();
    super.onInit();
  }

  @override
  void onReady() {
    initialDataLoad();
    super.onReady();
  }

  // asign to variable as recieved data by arguments
  receivedArguments() {
    requestType = Get.arguments?[paramsRequestType];
    searchKey.value = Get.arguments?[paramsSearchKey];
    selectedCategory.value = Get.arguments?[paramsSelectedCategory];
  }

  initData() async {
    selectedChipIndex.value =
        sourceListWithFilter.indexOf(selectedCategory.value);
    _selectedCountry = await _userPrefRepository.readFilterCountry();
    _selectedLanguage = await _userPrefRepository.readFilterLanguage();
  }

  initialDataLoad() {
    resetPage();
    getData(true);
  }

  dataListeners() {
    ever(newsListResponse, (_) {
      searchResultCount.value =
          thousandFormater.format(newsListResponse.value?.totalResults ?? 0);
      if (articleList.isEmpty) {
        articleList(newsListResponse.value?.articles ?? []);
      } else {
        articleList.addAll(newsListResponse.value?.articles ?? []);
      }
    });
  }

  // main function for data fetch for screen
  Future getData(bool isInitialLoading) async {
    if (isFilterCategory()) {
      if (searchKey.value.isNotEmpty) {
        await searchByFilterValues(
            searchKey.value,
            _selectedLanguage ?? Resources.defaultLanguage,
            page,
            isInitialLoading);
        return;
      }
    }
    await getNewsByCategory(_selectedCountry ?? '', _selectedLanguage ?? '',
        searchKey.value, selectedCategory.value, page, isInitialLoading);
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
      searchByString.value =
          [searchKey].where((element) => element.isNotEmpty).join(', ');
      pageIncrement(r.totalResults ?? 0);
      newsListResponse.value = r;
    });
  }

  // Get news by category and search key
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
      searchByString.value = [searchKeyWord, catgory]
          .where((element) => element.isNotEmpty)
          .join(', ');
      newsListResponse.value = r;
    });
  }

  // Tap on news card and open news detail screen
  onTapNewsCard(ArticlesModel item) {
    Get.toNamed(Routes.newsDetailsScreen, arguments: {
      paramsSelectedArticle: item,
    });
  }

  // Tap on news category chip button
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

  // check data fetchin from API or Local db
  isLoading() => loading.isVisible;

  // Perform the function when scrolling the news list
  onLoading() async {
    await getData(false);
  }

  // Perform the function when pull down the news list
  onRefresh() async {
    refreshController.loadComplete();
    resetPage();
    await getData(false);
    refreshController.refreshCompleted();
  }

  // page data and page reset before fetch the newest data
  resetPage() {
    page = 1;
    articleList.value = [];
  }

  // perform when tap the search button on key board actions
  onSubmitSearchTextField(String value) {
    searchKey.value = value;
    initialDataLoad();
  }

  isFilterCategory() => selectedCategory.value == Resources.labelFilter;

  // open filter bottomsheet view
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
