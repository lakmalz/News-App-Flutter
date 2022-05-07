import 'package:get/get.dart';
import 'package:news_app/utils/enum.dart';
import 'package:news_app/utils/extension.dart';

class DashboardController extends GetxController {
  final selectedIndex = eBottomNavigation.home.tabIndex.obs;
  RxBool isVisibleBottomBar = false.obs;
  
  
  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 600), () {
      isVisibleBottomBar.value = true;
    });
    super.onInit();
  }

  didPressedOnTab(int index) {
    selectedIndex(index);
  }

  visibleBottomBar(bool isVisible) {
    isVisibleBottomBar.value = isVisible;
  }
}
