import 'package:flutter/material.dart';
import 'package:news_app/utils/global_widgets/v_spacer.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/resources.dart';
import 'package:news_app/utils/styles/styles.dart';

class BottomMenuIcon extends StatelessWidget {
  const BottomMenuIcon(
      {Key? key,
      required this.icon,
      required this.isSelected,
      required this.onPressed})
      : super(key: key);
  final String icon;
  final bool isSelected;
  final VoidCallback onPressed;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(34, 12, 24, 8),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              color: isSelected ? AppColors.primaryColor : AppColors.greyColor,
            ),
            const VSpacer(space: 1),
            Text(
              Resources.lableHome,
              style: Styles.regular10pxTextStyle(
                  color:
                      isSelected ? AppColors.brownColor : AppColors.greyColor),
            ),
          ],
        ),
      ),
    );
  }
}
