import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/global_widgets/h_spacer.dart';
import 'package:news_app/utils/global_widgets/overlay_gradient_view.dart';
import 'package:news_app/utils/styles/theme_extension.dart';

class NewsListItemCard extends StatelessWidget {
  const NewsListItemCard({Key? key}) : super(key: key);

//TODO
  final String _img =
      'https://images.unsplash.com/photo-1633075389979-5373cd619588?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2232&q=80';

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
            onTap: () {},
            child: Stack(
              children: [
                _image(context, _img),
                const OverlayGradientView(),
                _headerTitle(
                    context, '5 things to know about the conunfrum of lupus'),
                _contentAndCreatedDate(
                  context,
                  content:
                      'Matt Villianosadfsadfasasdfasdf asas dfasdfasd asd asfasdf fasdfasdfasdf asdfas asdfadf ',
                  createdDate: 'Sunday, 9 May 2021',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Positioned _contentAndCreatedDate(BuildContext context,
      {String? content, String? createdDate}) {
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
                style: context.semibold12pxTextStyle(context.whiteColor)),
          ),
          const HSpacer(space: 24),
          Text(
            createdDate ?? '',
            textAlign: TextAlign.right,
            style: context.semibold12pxTextStyle(context.whiteColor),
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
        style: context.newyorkSemibold14pxTextStyle(context.whiteColor),
      ),
    );
  }

  CachedNetworkImage _image(BuildContext context, String? image) {
    return CachedNetworkImage(
      imageUrl: image ?? '',
      width: Get.width,
      height: Get.width / 3.0,
      //TODO
      // placeholder: (_, url) => placeholder(context),
      // errorWidget: (context, url, error) => placeholder(context),
      fit: BoxFit.cover,
    );
  }
}
