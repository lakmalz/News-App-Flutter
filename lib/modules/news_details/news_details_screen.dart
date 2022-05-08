
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/modules/news_details/components/blur_back_icon.dart';
import 'package:news_app/modules/news_details/components/blur_title_container.dart';
import 'package:news_app/modules/news_details/components/description_container.dart';
import 'package:news_app/modules/news_details/components/details_background_image.dart';
import 'package:news_app/modules/news_details/components/icon_add_favourite.dart';
import 'package:news_app/modules/news_details/components/rounded_top_description.dart';
import 'package:news_app/modules/news_details/news_details_controller.dart';
import 'package:news_app/utils/styles/dimensions.dart';

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
              return DetailsBackgrounImage(
                  articleModel: controller.articleModel());
            }),
          ),
          const BlurBackIcon(),
          const RoundedDescription(),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.detailTopImageHeight -
                (Dimensions.detailTopImageHeight / 2.3),
            child: BlurTitleContainer(
              articlesModel: controller.articleModel(),
            ),
          ),
          DescriptionContainer(
            content: controller.articleModel()?.content,
          ),
          const IconAddFavourite()
        ],
      ),
    );
  }
}


