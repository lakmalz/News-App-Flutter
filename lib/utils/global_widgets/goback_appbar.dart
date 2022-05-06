import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/styles/app_colors.dart';

class GoBackAppbar extends StatelessWidget implements PreferredSizeWidget {
  const GoBackAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: AppColors.blackColor,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
