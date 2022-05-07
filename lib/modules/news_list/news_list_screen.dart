import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/modules/home_screen/components/search_edit_field.dart';
import 'package:news_app/modules/news_list/news_list_controller.dart';
import 'package:news_app/utils/global_widgets/data_empty.dart';
import 'package:news_app/utils/global_widgets/news_list_item_card.dart';
import 'package:news_app/utils/global_widgets/refresh_custom_footer.dart';
import 'package:news_app/utils/global_widgets/single_select_chip_list.dart';
import 'package:news_app/utils/global_widgets/v_spacer.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/styles.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
                  onSubmitted: (value) => controller.onSubmitSearchTextField(value),
                  onTapSuffixIcon: () {
                    Get.back();
                  },
                ),
              ),
              Obx(
                () => SingleSelectChipList(
                  initialIndex: controller.selectedChipIndex(),
                  chipString: controller.sourceListWithFilter,
                  extraOnToggle: (index) =>
                      controller.onTapChipNewsCategory(index, context),
                ),
              ),
              Obx(() => Container(
                    margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        style: Styles.semibold14pxTextStyle(),
                        children: [
                          TextSpan(
                              text:
                                  'About ${controller.searchResultCount()} result for '),
                          TextSpan(
                              text: controller.searchByString(),
                              style: Styles.bold14pxTextStyle()),
                        ],
                      ),
                    ),
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Obx(
                    () => SmartRefresher(
                        enablePullDown: true,
                        enablePullUp: true,
                        header: const WaterDropHeader(),
                        footer: const CustomFooterRefresher(),
                        controller: controller.refreshController,
                        onLoading: controller.onLoading,
                        onRefresh: controller.onRefresh,
                        child: ListView.separated(
                          itemBuilder: (_, index) {
                            final _item = controller.articleList[index];
                            return NewsListItemCard(
                              _item,
                              onTap: controller.onTapNewsCard,
                            );
                          },
                          separatorBuilder: (_, index) =>
                              const VSpacer(space: 8),
                          itemCount: controller.articleList.length,
                        )),
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
