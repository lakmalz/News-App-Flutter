import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/styles.dart';

class GradientButton extends StatelessWidget {
  const GradientButton(
      {Key? key,
      this.buttonText,
      this.onPressed,
      this.isEnable = false,
      this.borderColor})
      : super(key: key);
  final String? buttonText;
  final VoidCallback? onPressed;
  final bool isEnable;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnable ? onPressed : null,
      child: Expanded(
        child: Container(
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border:
                Border.all(width: 2, color: borderColor ?? Colors.transparent),
            gradient: isEnable
                ? AppColors.buttonLinearGradient
                : AppColors.buttonDisableLinearGradient,
          ),
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
