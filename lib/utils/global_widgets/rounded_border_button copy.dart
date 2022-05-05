import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/styles.dart';

class RoundedBorderButton extends StatelessWidget {
  const RoundedBorderButton(
      {Key? key, this.buttonText, this.borderColor = Colors.black87, this.onPressed})
      : super(key: key);
  final String? buttonText;
  final Color borderColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Expanded(
        child: Container(
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.transparent,
              border: Border.all(color: borderColor, width: 1)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Text(
              buttonText ?? 'Button',
              style: Styles.bold16pxTextStyle(AppColors.whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
