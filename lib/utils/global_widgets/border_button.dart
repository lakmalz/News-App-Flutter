import 'package:flutter/material.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/styles.dart';

class BorderButton extends StatelessWidget {
  const BorderButton(
      {Key? key,
      this.buttonText,
      this.onPressed,
      this.isDisable = false,
      this.borderColor = Colors.black})
      : super(key: key);
  final String? buttonText;
  final VoidCallback? onPressed;
  final bool isDisable;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisable ? null : onPressed,
      child: Expanded(
        child: Container(
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(width: 2,color: borderColor),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Text(
              buttonText ?? 'Button',
              style: Styles.bold16pxTextStyle(AppColors.primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
