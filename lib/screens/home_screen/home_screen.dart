import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_app/screens/home_screen/home_controller.dart';
import 'package:news_app/screens/home_screen/widgets/top_heading_slider.dart';
import 'package:news_app/utils/global_widgets/h.spacer.dart';
import 'package:news_app/utils/global_widgets/rounded_icon_button.dart';
import 'package:news_app/screens/home_screen/widgets/search_edit_field.dart';
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
              const Expanded(child: SearchEditField()),
              RoundedIconButton(
                onPressed: () {},
                icon: Image.asset(icBell),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _latestHeadingText(context),
              TopHeadingSlider(),
            ],
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
