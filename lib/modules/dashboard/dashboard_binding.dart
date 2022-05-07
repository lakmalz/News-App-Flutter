import 'package:get/instance_manager.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/modules/dashboard/dashboard_controller.dart';
import 'package:news_app/modules/favourite_screen/favourite_controller.dart';
import 'package:news_app/modules/home_screen/home_controller.dart';
import 'package:news_app/modules/profile_screen/profile_controller.dart';

class DashboardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => NewsRepository());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => FavouriteController());
    Get.lazyPut(() => ProfileController());
  }

}