import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/modules/news_details/components/blur_title_container.dart';
import 'package:news_app/modules/news_details/components/details_background_image.dart';
import 'package:news_app/modules/news_details/news_details_controller.dart';
import 'package:news_app/utils/global_widgets/back_icon.dart';
import 'package:news_app/utils/global_widgets/created_date_text.dart';
import 'package:news_app/utils/global_widgets/v_spacer.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/dimensions.dart';
import 'package:news_app/utils/styles/resources.dart';
import 'package:news_app/utils/styles/styles.dart';

class NewsDetailsScreen extends GetView<NewsDetailsController> {
  const NewsDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Obx(() {
              return DetailsBackgrounImage(articleModel: controller.articleModel());
            }),
          ),
          Positioned(
            top: 45,
            left: 16,
            child: Row(
              children: [
                BackIcon(icon: Resources.icBack),
              ],
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.detailTopImageHeight - 20,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: Colors.grey.shade100,
                ),
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  children: const [
                    VSpacer(space: 10),
                  ],
                ),
              )),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.detailTopImageHeight -
                (Dimensions.detailTopImageHeight / 2.3),
            child: BlurTitleContainer(
              articlesModel: controller.articleModel(),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: Dimensions.detailTopImageHeight + 56,
              child: Obx(() => SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.articleModel()?.content??''),
                    ],
                  ),
                ),
              ),))
        ],
      ),
    );
  }
}


