import 'package:get/get.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/routes/app_routes.dart';
import 'package:news_app/services/loading_progress_service.dart';
import 'package:news_app/utils/base_controller.dart';
import 'package:news_app/utils/constant.dart';
import 'package:news_app/utils/styles/resources.dart';

class NewsListController extends BaseController {
  final LoadingProgressService _loadingProgress = Get.find();
  final NewsRepository _newsRepository = Get.find();
  List<String> sourceListWithFilter = [
    Resources.labelFilter,
    ...Resources.sourceList
  ];
  RxList<ArticlesModel> articleList = RxList();
  RxInt selectedChipIndex = 0.obs;
  RxString searchKey = ''.obs;
  String? _scope;
  @override
  void onInit() {
    searchKey.value = Get.arguments?[PARAMS_SEARCH_KEY];
    super.onInit();
  }

  @override
  void onReady() {
    dataRefresh();
    super.onReady();
  }

  dataRefresh() {
    searchNewsByTopicAndKey(searchKey.value, _scope);
  }

  searchNewsByTopicAndKey(String? key, String? scope) async {
    _loadingProgress.show();
    final _response =
        await _newsRepository.searchNewsByTopicAndKey(key ?? '', scope ?? '');
    _loadingProgress.hide();
    _response?.fold((l) {
      showError(l);
    }, (r) {
      Get.log('${r.status}');
      articleList(r.articles ?? []);
    });
  }

  onTapNewsCard(ArticlesModel item) {
    Get.toNamed(Routes.newsDetailsScreen, arguments: {
      PARAMS_SELECTED_ARTICLE: item,
    });
  }

  onTapChipNewsCategory(int index) {
    selectedChipIndex(index);
    _scope = sourceListWithFilter[index];
    if (_scope != Resources.labelFilter) {
      dataRefresh();
    }
  }
}
