import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/screens/home_screen/home_controller.dart';
import 'package:news_app/screens/home_screen/widgets/top_heading_slider.dart';
import 'package:news_app/utils/global_widgets/h_spacer.dart';
import 'package:news_app/utils/global_widgets/overlay_gradient_view.dart';
import 'package:news_app/utils/global_widgets/rounded_icon_button.dart';
import 'package:news_app/screens/home_screen/widgets/search_edit_field.dart';
import 'package:news_app/utils/global_widgets/single_select_chip_list.dart';
import 'package:news_app/utils/global_widgets/v_spacer.dart';
import 'package:news_app/utils/styles/resources_constant.dart';
import 'package:news_app/utils/styles/theme_extension.dart';

//TODO
final String _img =
    'https://images.unsplash.com/photo-1633075389979-5373cd619588?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2232&q=80';

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
                  itemBuilder: (_, index) => _newsListItemCard(context),
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

  Widget _newsListItemCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        width: Get.width,
        height: Get.width / 3.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: InkWell(
            onTap: () {},
            child: Stack(
              children: [
                _image(context, _img),
                const OverlayGradientView(),
                Positioned(
                  left: 16,
                  right: 16,
                  top: 8,
                  child: Text(
                    '5 things to know about the conunfrum of lupus',
                    style: context
                        .newyorkSemibold14pxTextStyle(context.whiteColor),
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 8,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Matt Villianosadfsadfasasdfasdf asas dfasdfasd asd asfasdf fasdfasdfasdf asdfas asdfadf ',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context
                              .semibold12pxTextStyle(context.whiteColor),
                        ),
                      ),
                      const HSpacer(space: 24),
                      Text(
                        'Sunday, 9 May 2021',
                        textAlign: TextAlign.right,
                        style: context
                            .semibold12pxTextStyle(context.whiteColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CachedNetworkImage _image(BuildContext context, String image) {
    return CachedNetworkImage(
      imageUrl: image,
      width: Get.width,
      height: Get.width / 3.0,
      //TODO
      // placeholder: (_, url) => placeholder(context),
      // errorWidget: (context, url, error) => placeholder(context),
      fit: BoxFit.cover,
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
