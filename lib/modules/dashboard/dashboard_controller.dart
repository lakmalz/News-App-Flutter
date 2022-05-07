import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:news_app/services/loading_progress_service.dart';
import 'package:news_app/utils/enum.dart';
import 'package:news_app/utils/extension.dart';
import 'package:news_app/utils/failure.dart';

import '../../data/remote/response/news_list_response.dart';

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
