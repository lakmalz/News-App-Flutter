import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/modules/home_screen/components/latest_news_header.dart';
import 'package:news_app/modules/home_screen/components/search_edit_field.dart';
import 'package:news_app/modules/home_screen/components/top_heading_slider.dart';
import 'package:news_app/modules/home_screen/home_controller.dart';
import 'package:news_app/utils/enum.dart';
import 'package:news_app/utils/global_widgets/default_padding.dart';
import 'package:news_app/utils/global_widgets/news_list_item_card.dart';
import 'package:news_app/utils/global_widgets/refresh_custom_footer.dart';
import 'package:news_app/utils/global_widgets/rounded_icon_button.dart';
import 'package:news_app/utils/global_widgets/single_select_chip_list.dart';
import 'package:news_app/utils/global_widgets/v_spacer.dart';
import 'package:news_app/utils/styles/resources.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          DefaultPadding(
            child: Row(
              children: [
                Expanded(
                  child: SearchEditField(
                    onSubmitted: (value) => controller.onSearch(value),
                  ),
                ),
                RoundedIconButton(
                  onPressed: () {},
                  icon: Image.asset(Resources.icBell),
                ),
              ],
            ),
          ),
          Expanded(
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              header: const WaterDropHeader(),
              footer: const CustomFooterRefresher(),
              controller: controller.refreshController,
              onLoading: controller.onLoading,
              onRefresh: controller.onRefresh,
              child: ListView(
                controller: controller.scrollController,
                children: [
                  Obx(
                    () => controller.breakingNewsList().isNotEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              LatestNewsHeader(
                                  onTap: () => controller.navigateToNewsList(
                                      eRequestType.headlines)),
                              TopHeadingSlider(
                                onTap: controller.onTapNewsCard,
                                sliderList: controller.breakingNewsList(),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ),
                  Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: SingleSelectChipList(
                              initialIndex: controller.selectedChipIndex(),
                              chipString: controller.sourceList,
                              extraOnToggle: controller.onTapChipNewsCategory,
                            )),
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (_, index) {
                            final _item = controller.articleList[index];
                            return NewsListItemCard(
                              _item,
                              onTap: controller.onTapNewsCard,
                            );
                          },
                          separatorBuilder: (_, index) => const VSpacer(space: 8),
                          itemCount: controller.articleList().length,
                          shrinkWrap: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
