import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_app/screens/favourite_screen/favourite_controller.dart';
import 'package:news_app/screens/user_registration/registration_controller.dart';
import 'package:news_app/utils/global_widgets/goback_appbar.dart';
import 'package:news_app/utils/global_widgets/gradient_button.dart';
import 'package:news_app/utils/global_widgets/input_field.dart';
import 'package:news_app/utils/global_widgets/v_spacer.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/dimensions.dart';
import 'package:news_app/utils/styles/resources.dart';
import 'package:news_app/utils/styles/styles.dart';

class RegistrationScreen extends GetView<RegistrationController> {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GoBackAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Spacer(),
            Text(
              'Create\nAccount',
              style: Styles.bold32pxTextStyle(AppColors.primaryColor),
            ),
            const Spacer(),
            InputField(hintText: Resources.hintTextName),
            const VSpacer(
              space: 16,
            ),
            InputField(hintText: Resources.hintTextUserName),
            const VSpacer(
              space: 16,
            ),
            InputField(hintText: Resources.hintTextPassword),
            const VSpacer(
              space: 24,
            ),
            GradientButton(
              buttonText: 'Sign up',
              onPressed: () {},
            ),
            const VSpacer(
              space: 20,
            ),
            Expanded(
              child: VSpacer(
                space: Dimensions.loginBottomSpace,
              ),
            )
          ],
        ),
      ),
    );
  }
}
