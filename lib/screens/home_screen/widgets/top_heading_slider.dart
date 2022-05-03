import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/global_widgets/v_spacer.dart';
import 'package:news_app/utils/styles/theme_extension.dart';

class TopHeadingSlider extends StatelessWidget {
  TopHeadingSlider({Key? key, this.onTap}) : super(key: key);

  final List<int> sliderList = [1, 2, 3, 4, 5];
  final Function()? onTap;
  final String _img =
      'https://images.unsplash.com/photo-1633075389979-5373cd619588?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2232&q=80';

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: _carouseOptions(),
      items: sliderList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: _boxShadow(context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: InkWell(
                    onTap: onTap,
                    child: Stack(
                      children: [
                        _image(context, _img),
                        _overlayShadow(context),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              const VSpacer(space: 30),
                              _autherText(context,
                                  'By: Ryan Browne kdsj oskaogaso kgoaso oaskdg kdsjfkasjdofjojo'),
                              _titleText(context,
                                  'Crypto investores should be proapare to lose all there monet BOR goener says Olasdf asf asdasf'),
                              const Spacer(),
                              Flexible(
                                child: _contentText(
                                    context, 'aasda sdgasdgas asdg'),
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

  Text _contentText(BuildContext context, String content) {
    return Text(
      content,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: context.regular10pxTextStyle(context.whiteColor),
    );
  }

  Text _titleText(BuildContext context, String title) {
    return Text(
      title,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: context.newyorkBold16pxTextStyle(context.whiteColor),
    );
  }

  Text _autherText(BuildContext context, String auther) {
    return Text(
      auther,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: context.extraBold10pxTextStyle(context.whiteColor),
    );
  }

  Container _overlayShadow(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: ShapeDecoration(
        shape: const RoundedRectangleBorder(),
        gradient: context.cardOverlayLinearGradient,
      ),
    );
  }

  CarouselOptions _carouseOptions() {
    return CarouselOptions(
        height: Get.width / 1.8,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height);
  }

  BoxDecoration _boxShadow(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: [
        BoxShadow(
          color: context.greyColor,
          spreadRadius: 0.5,
          blurRadius: 4,
        ),
      ],
    );
  }

  Container placeholder(BuildContext context) {
    return Container(
      color: context.borderColor.withOpacity(0.2),
      width: Get.width,
      height: Get.height,
    );
  }

  CachedNetworkImage _image(BuildContext context, String image) {
    return CachedNetworkImage(
      imageUrl: image,
      width: Get.width,
      height: Get.height,
      placeholder: (_, url) => placeholder(context),
      errorWidget: (context, url, error) => placeholder(context),
      fit: BoxFit.cover,
    );
  }
}
