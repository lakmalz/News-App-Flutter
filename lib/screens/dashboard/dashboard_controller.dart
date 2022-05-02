import 'package:get/get.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/services/loading_progress_service.dart';

class DashboardController extends GetxController{
  final LoadingProgressService _loadingProgress = Get.find();
  final NewsRepository _newsRepository = Get.find();

  final RxList<ArticlesModel> articleList = RxList();

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

@override
  void onReady() {
    search();
    super.onReady();
  }

  search()async{
      _loadingProgress.show();
      final _response = await _newsRepository.searchNewsByTopicAndKey('top', 'BBC-News');
      _response.fold((l) {
        Get.log(l.message);
      } , (r) {
        Get.log('${r.status}');
         articleList.value = r.articles ?? [];
      });
      _loadingProgress.hide();
  }
}