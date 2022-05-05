import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/styles/app_colors.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.borderColor.withOpacity(0.2),
      width: Get.width,
      height: Get.height,
    );
  }
}