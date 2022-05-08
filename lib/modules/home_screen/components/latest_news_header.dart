import 'package:flutter/material.dart';
import 'package:news_app/utils/global_widgets/h_spacer.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/resources.dart';
import 'package:news_app/utils/styles/styles.dart';

class LatestNewsHeader extends StatelessWidget {
  LatestNewsHeader({Key? key, required this.onTap}) : super(key: key);
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12),
      child: Row(
        children: [
          Text(Resources.labelLatestNews,
              style: Styles.smallNewyork18pxTextStyle(AppColors.blackColor)),
          const Spacer(),
          InkWell(
            onTap: () => onTap(),
            child: Text(Resources.labelSeeAll,
                style: Styles.semibold12pxTextStyle(
                    color: AppColors.secondaryColor)),
          ),
          const HSpacer(space: 8),
          Image.asset(Resources.icRightArrow)
        ],
      ),
    );
  }
}
