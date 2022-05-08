import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_app/modules/auth/auth_controller.dart';
import 'package:news_app/modules/profile_screen/profile_controller.dart';
import 'package:news_app/utils/global_widgets/border_button.dart';
import 'package:news_app/utils/global_widgets/v_spacer.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/dimensions.dart';
import 'package:news_app/utils/styles/resources.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text('User Email: ${controller.authController.userEmail}'),
        const VSpacer(space: 24,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal:Dimensions.screenWidth/3),
          child: BorderButton(
            borderColor: AppColors.blackColor,
            buttonText: Resources.labelLogout,
            onPressed: () => controller.onTapLogout(),
          ),
        ),
        const Spacer()
      ],
    );
  }
}
