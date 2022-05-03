import 'package:get/get.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/services/loading_progress_service.dart';
import 'package:news_app/utils/base_controller.dart';
import 'package:news_app/utils/constant.dart';

class NewsListController extends BaseController {
  final LoadingProgressService _loadingProgress = Get.find();
  final NewsRepository _newsRepository = Get.find();
  RxList<ArticlesModel> articleList = RxList();
  String? _searchKey;
  String? _scope;

  @override
  void onInit() {
    _searchKey = Get.arguments?[PARAMS_SEARCH_KEY];
    super.onInit();
  }

  @override
  void onReady() {
    searchNewsByTopicAndKey(_searchKey, _scope);
    super.onReady();
  }

  searchNewsByTopicAndKey(String? key, String? scope) async {
    _loadingProgress.show();
    final _response =
        await _newsRepository.searchNewsByTopicAndKey(key ?? '', scope ?? '');
      _loadingProgress.hide();
    _response.fold((l) {
      showError(l);
    }, (r) {
      Get.log('${r.status}');
      articleList(r.articles ?? []);
    });
  }
}
