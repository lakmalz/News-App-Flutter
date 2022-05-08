import 'package:flutter/material.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/dimensions.dart';

class DetailsBackgrounImage extends StatelessWidget {
  const DetailsBackgrounImage({
    Key? key,
    required this.articleModel,
  }) : super(key: key);

  final ArticlesModel? articleModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: Dimensions.detailTopImageHeight,
      decoration: BoxDecoration(
        color: AppColors.blackColor.withOpacity(0.4),
        image: DecorationImage(
          image: NetworkImage(articleModel?.urlToImage ?? ''),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
