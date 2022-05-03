import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/screens/home_screen/widgets/search_edit_field.dart';
import 'package:news_app/screens/news_list/news_list_controller.dart';
import 'package:news_app/utils/global_widgets/news_list_item_card.dart';
import 'package:news_app/utils/global_widgets/single_select_chip_list.dart';
import 'package:news_app/utils/global_widgets/v_spacer.dart';
import 'package:news_app/utils/resources_constant.dart';

class NewsListScreen extends GetView<NewsListController> {
  const NewsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Obx(
                () => SearchEditField(
                  initialText: controller.searchKey.value,
                  isEnable: false,
                  onTapSuffixIcon: () {
                    Get.back();
                  },
                ),
              ),
              Obx(() => SingleSelectChipList(
                  initialIndex: controller.selectedChipIndex(),
                  chipString: controller.sourceListWithFilter,
                  extraOnToggle: (index) {
                    controller.selectedChipIndex(index);
                  })),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top:16.0),
                  child: ListView.separated(
                    itemBuilder: (_, index) => const NewsListItemCard(),
                    separatorBuilder: (_, index) => const VSpacer(space: 8),
                    itemCount: 12,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
