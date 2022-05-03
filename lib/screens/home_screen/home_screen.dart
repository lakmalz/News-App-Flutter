import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/screens/home_screen/home_controller.dart';
import 'package:news_app/screens/home_screen/widgets/top_heading_slider.dart';
import 'package:news_app/utils/global_widgets/h_spacer.dart';
import 'package:news_app/utils/global_widgets/news_list_item_card.dart';
import 'package:news_app/utils/global_widgets/rounded_icon_button.dart';
import 'package:news_app/screens/home_screen/widgets/search_edit_field.dart';
import 'package:news_app/utils/global_widgets/single_select_chip_list.dart';
import 'package:news_app/utils/global_widgets/v_spacer.dart';
import 'package:news_app/utils/styles/resources_constant.dart';
import 'package:news_app/utils/styles/theme_extension.dart';

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
                  onSubmitted:(value) => controller.onSearch(value),
                ),
              ),
              RoundedIconButton(
                onPressed: () {},
                icon: Image.asset(icBell),
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
                  child: Obx(() => SingleSelectChipList(
                      initialIndex: controller.selectedChipIndex(),
                      chipString: sourceList,
                      extraOnToggle: (index) {
                        controller.selectedChipIndex(index);
                      })),
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) => const NewsListItemCard(),
                  separatorBuilder: (_, index) => const VSpacer(space: 8),
                  itemCount: 12,
                  shrinkWrap: true,
                )
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
          Text(labelLatestNews,
              style: context.smallNewyork18pxTextStyle(context.blackColor)),
          const Spacer(),
          Text(labelSeeAll,
              style: context.semibold12pxTextStyle(context.secondaryColor)),
          const HSpacer(space: 8),
          Image.asset(icRightArrow)
        ],
      ),
    );
  }
}
