import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_app/modules/favourite_screen/favourite_controller.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/styles.dart';

class FavouriteScreen extends GetView<FavouriteController> {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('Under Constructions.', style: Styles.semiBold22pxTextStyle(color: AppColors.blackColor.withOpacity(0.4)),),
    );
  }
}

// login and log out 
// dash board come again
