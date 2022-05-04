import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/screens/home_screen/components/search_edit_field.dart';
import 'package:news_app/screens/home_screen/components/top_heading_slider.dart';
import 'package:news_app/screens/home_screen/home_controller.dart';
import 'package:news_app/utils/global_widgets/h_spacer.dart';
import 'package:news_app/utils/global_widgets/news_list_item_card.dart';
import 'package:news_app/utils/global_widgets/rounded_icon_button.dart';
import 'package:news_app/utils/global_widgets/single_select_chip_list.dart';
import 'package:news_app/utils/global_widgets/v_spacer.dart';
import 'package:news_app/utils/styles/resources.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/styles.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _latestHeadingText(context),
                TopHeadingSlider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Obx(
                    () => SingleSelectChipList(
                      initialIndex: controller.selectedChipIndex(),
                      chipString: controller.sourceList,
                      extraOnToggle: controller.onTapChipNewsCategory,
                    ),
                  ),
                ),
                Obx(
                  () => ListView.separated(
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
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Padding _latestHeadingText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12),
      child: Row(
        children: [
          Text(Resources.labelLatestNews,
              style: Styles.smallNewyork18pxTextStyle(AppColors.blackColor)),
          const Spacer(),
          Text(Resources.labelSeeAll,
              style: Styles.semibold12pxTextStyle(AppColors.secondaryColor)),
          const HSpacer(space: 8),
          Image.asset(Resources.icRightArrow)
        ],
      ),
    );
  }
}
