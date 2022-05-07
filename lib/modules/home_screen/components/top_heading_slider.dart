import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/utils/global_widgets/image_placeholder.dart';
import 'package:news_app/utils/global_widgets/overlay_gradient_view.dart';
import 'package:news_app/utils/global_widgets/v_spacer.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/styles.dart';

class TopHeadingSlider extends StatelessWidget {
  const TopHeadingSlider({Key? key, required this.sliderList, required this.onTap})
      : super(key: key);

  final List<ArticlesModel> sliderList;
  final Function(ArticlesModel) onTap;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: _carouseOptions(),
      items: sliderList.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: _boxShadow(context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: InkWell(
                    onTap: () {
                      onTap(item);
                    },
                    child: Stack(
                      children: [
                        _image(context, item.urlToImage ?? ''),
                        const OverlayGradientView(),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              const VSpacer(space: 30),
                              _autherText(context, item.author ?? ''),
                              _titleText(context, item.title ?? ''),
                              const Spacer(),
                              Flexible(
                                child: _descriptionText(
                                    context, item.description ?? ''),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Text _descriptionText(BuildContext context, String content) {
    return Text(
      content,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Styles.regular10pxTextStyle(color: AppColors.whiteColor),
    );
  }

  Text _titleText(BuildContext context, String title) {
    return Text(
      title,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: Styles.newyorkBold16pxTextStyle(AppColors.whiteColor),
    );
  }

  // Author text widget
  // The value hide, If the auther is empty
  Widget _autherText(BuildContext context, String auther) {
    return auther.isNotEmpty
        ? Text(
            'By: $auther',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Styles.extraBold10pxTextStyle(AppColors.whiteColor),
          )
        : const SizedBox();
  }

  // Breaking news slider widget style configuration option values
  CarouselOptions _carouseOptions() {
    return CarouselOptions(
        height: Get.width / 1.7,
        enlargeCenterPage: true,
        initialPage: 1,
        enlargeStrategy: CenterPageEnlargeStrategy.height);
  }

  BoxDecoration _boxShadow(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: [
        BoxShadow(
          color: AppColors.greyColor,
          spreadRadius: 0.5,
          blurRadius: 4,
        ),
      ],
    );
  }

  // Cache network image for Breaking news card background
  // Place holder and error widget used as a grey color container
  CachedNetworkImage _image(BuildContext context, String image) {
    return CachedNetworkImage(
      imageUrl: image,
      width: Get.width,
      height: Get.height,
      placeholder: (_, url) => const ImagePlaceholder(),
      errorWidget: (context, url, error) => const ImagePlaceholder(),
      fit: BoxFit.cover,
    );
  }
}
