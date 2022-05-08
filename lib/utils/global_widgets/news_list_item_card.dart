import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/utils/global_widgets/created_date_text.dart';
import 'package:news_app/utils/global_widgets/h_spacer.dart';
import 'package:news_app/utils/global_widgets/image_placeholder.dart';
import 'package:news_app/utils/global_widgets/overlay_gradient_view.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/styles.dart';

class NewsListItemCard extends StatelessWidget {
  const NewsListItemCard(this.item, {Key? key, this.onTap}) : super(key: key);
  final ArticlesModel item;
  final Function(ArticlesModel)? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        width: Get.width,
        height: Get.width / 3.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: InkWell(
            onTap: () {
              if (onTap == null) return;

              onTap!(item);
            },
            child: Stack(
              children: [
                _image(context, item.urlToImage),
                const OverlayGradientView(),
                _headerTitle(context, item.title),
                _contentAndCreatedDate(
                  context,
                  content: item.description,
                  publishedDate: item.publishedAt,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Positioned _contentAndCreatedDate(BuildContext context,
      {String? content, String? publishedDate}) {
    return Positioned(
      left: 16,
      right: 16,
      bottom: 8,
      child: Row(
        children: [
          Expanded(
            child: Text(content ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.semibold12pxTextStyle(color: AppColors.whiteColor)),
          ),
          const HSpacer(space: 24),
          CreatedDateText(
            createdDate: publishedDate,
          )
        ],
      ),
    );
  }

  Positioned _headerTitle(BuildContext context, String? title) {
    return Positioned(
      left: 16,
      right: 16,
      top: 8,
      child: Text(
        title ?? '',
        style: Styles.newyorkSemibold14pxTextStyle(AppColors.whiteColor),
      ),
    );
  }

  CachedNetworkImage _image(BuildContext context, String? image) {
    return CachedNetworkImage(
      imageUrl: image ?? '',
      width: Get.width,
      height: Get.width / 3.0,
      placeholder: (_, url) => const ImagePlaceholder(),
      errorWidget: (context, url, error) => const ImagePlaceholder(),
      fit: BoxFit.cover,
    );
  }
}
