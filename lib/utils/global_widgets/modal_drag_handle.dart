import 'package:flutter/material.dart';
import 'package:news_app/utils/styles/app_colors.dart';

class ModalDragHandle extends StatelessWidget {
  const ModalDragHandle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 5,
      decoration: BoxDecoration(
        color: AppColors.blackColor.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
