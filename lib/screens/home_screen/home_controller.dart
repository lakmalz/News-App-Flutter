import 'package:get/get.dart';
import 'package:news_app/routes/app_routes.dart';
import 'package:news_app/utils/constant.dart';

class HomeController extends GetxController{
  RxInt selectedChipIndex = 0.obs;

  onSearch(String value) {
    if(value.isNotEmpty){
      openNewsList(value);
    }
  }

  openNewsList(String searchKey){
    Get.toNamed(Routes.newsListScreen,
        arguments: {PARAMS_SEARCH_KEY: searchKey});
  }
}