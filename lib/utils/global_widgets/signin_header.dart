import 'package:flutter/material.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/resources.dart';
import 'package:news_app/utils/styles/styles.dart';

class SigninHeader extends StatelessWidget {
  const SigninHeader({Key? key, required this.title, required this.subTitle})
      : super(key: key);
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Styles.bold48pxTextStyle(AppColors.primaryColor),
        ),
        Text(
          subTitle,
          style: Styles.semibold22pxTextStyle(
              color: AppColors.blackColor.withOpacity(0.5)),
        ),
      ],
    );
  }
}
