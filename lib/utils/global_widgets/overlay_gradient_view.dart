import 'package:flutter/material.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/styles.dart';

class OverlayGradientView extends StatelessWidget {
  const OverlayGradientView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.blackColor.withOpacity(0.16),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: ShapeDecoration(
            shape: const RoundedRectangleBorder(),
            gradient: AppColors.cardOverlayLinearGradient,
          ),
        ),
      ],
    );
  }
}