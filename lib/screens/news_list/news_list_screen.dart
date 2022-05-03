import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/screens/home_screen/widgets/search_edit_field.dart';
import 'package:news_app/screens/news_list/news_list_controller.dart';

class NewsListScreen extends GetView<NewsListController> {
  const NewsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Obx(
                () => SearchEditField(
                  initialText: controller.searchKey.value,
                  isEnable: false,
                  onTapSuffixIcon: () {
                    Get.back();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
