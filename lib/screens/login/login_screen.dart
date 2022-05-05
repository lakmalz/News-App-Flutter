import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_app/screens/favourite_screen/favourite_controller.dart';
import 'package:news_app/utils/global_widgets/gradient_button.dart';
import 'package:news_app/utils/global_widgets/input_field.dart';
import 'package:news_app/utils/global_widgets/rounded_border_button%20copy.dart';
import 'package:news_app/utils/global_widgets/v_spacer.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/dimensions.dart';
import 'package:news_app/utils/styles/resources.dart';
import 'package:news_app/utils/styles/styles.dart';

class LoginScreen extends GetView<FavouriteController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Spacer(),
              InputField(hintText: Resources.hintTextUserName),
              const VSpacer(
                space: 16,
              ),
              InputField(hintText: Resources.hintTextPassword),
              const VSpacer(
                space: 24,
              ),
              GradientButton(
                buttonText: 'Login',
                onPressed: () {},
              ),

               const VSpacer(
                space: 24,
              ),
              Text('Registration',
                  textAlign: TextAlign.center,
                  style: Styles.bold16pxTextStyle(AppColors.blackColor)),
              VSpacer(
                space: Dimensions.loginBottomSpace,
              )
            ],
          ),
        ),
      ),
    );
  }
}
