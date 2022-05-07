import 'package:get/get.dart';
import 'package:news_app/modules/news_list/news_list_controller.dart';

class NewsListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NewsListController());
  }

}