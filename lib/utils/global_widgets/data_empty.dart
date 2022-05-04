import 'package:flutter/material.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/styles.dart';

class DataEmpty extends StatelessWidget {
  const DataEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          'News not available',
          style: Styles.newyorkBold16pxTextStyle(AppColors.blackColor),
        ),
        const Spacer(),
      ],
    );
  }
}
