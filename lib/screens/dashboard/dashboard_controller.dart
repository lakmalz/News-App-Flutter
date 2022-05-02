import 'package:get/get.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/services/loading_progress_service.dart';
import 'package:news_app/utils/enum.dart';
import 'package:news_app/utils/extension.dart';

class DashboardController extends GetxController {
  final LoadingProgressService _loadingProgress = Get.find();
  final NewsRepository _newsRepository = Get.find();
  final selectedIndex = eBottomNavigation.home.tabIndex.obs;

  final RxList<ArticlesModel> articleList = RxList();

  @override
  void onReady() {
    // search();
    super.onReady();
  }

  search() async {
    _loadingProgress.show();
    final _response =
        await _newsRepository.searchNewsByTopicAndKey('top', 'BBC-News');
    _response.fold((l) {
      Get.log(l.message);
    }, (r) {
      Get.log('${r.status}');
      articleList.value = r.articles ?? [];
    });
    _loadingProgress.hide();
  }


  didPressedOnTab(int index) {
    selectedIndex(index);
  }
}
