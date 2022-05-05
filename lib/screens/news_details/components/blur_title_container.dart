import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/utils/global_widgets/created_date_text.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/dimensions.dart';
import 'package:news_app/utils/styles/styles.dart';

class BlurTitleContainer extends StatelessWidget {
  const BlurTitleContainer({Key? key, required this.articlesModel})
      : super(key: key);
  final ArticlesModel? articlesModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(35.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: Dimensions.screenWidth / 2.4,
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.6)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CreatedDateText(
                      createdDate: articlesModel?.publishedAt ?? '',
                      color: AppColors.brownColor),
                  Text(
                    articlesModel?.title ?? '',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style:
                        Styles.newyorkBold16pxTextStyle(AppColors.brownColor),
                  ),
                  Text(
                    'Published by ${articlesModel?.author ?? ''}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.extraBold10pxTextStyle(AppColors.brownColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
