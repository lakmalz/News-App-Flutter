import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_app/modules/login/login_controller.dart';
import 'package:news_app/utils/global_widgets/app_scafold.dart';
import 'package:news_app/utils/global_widgets/border_button.dart';
import 'package:news_app/utils/global_widgets/gradient_button.dart';
import 'package:news_app/utils/global_widgets/input_field.dart';
import 'package:news_app/utils/global_widgets/v_spacer.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/dimensions.dart';
import 'package:news_app/utils/styles/resources.dart';
import 'package:news_app/utils/styles/styles.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          const Spacer(),
          Text(
            Resources.labelWelcome,
            style: Styles.bold32pxTextStyle(AppColors.primaryColor),
          ),
          const Spacer(),
          Obx(
            () => Column(
              children: [
                InputField(
                  hintText: Resources.hintTextEmail,
                  errorMessage: controller.errEmail.value,
                  onChanged: (text) {
                    controller.email.value = text;
                  },
                ),
                const VSpacer(
                  space: 16,
                ),
                InputField(
                  hintText: Resources.hintTextPassword,
                  errorMessage: controller.errPassword.value,
                  onChanged: (text) {
                    controller.password.value = text;
                  },
                ),
                const VSpacer(
                  space: 24,
                ),
                GradientButton(
                  isEnable: controller.isEnableButton.value,
                  buttonText: Resources.labelSignin,
                  onPressed: () => controller.onTapSignin(),
                ),
                const VSpacer(
                  space: 20,
                ),
                BorderButton(
                  borderColor: AppColors.primaryColor,
                  buttonText: Resources.labelSignup,
                  onPressed: () => controller.onTapSignup(),
                ),
              ],
            ),
          ),
          Expanded(
            child: VSpacer(
              space: Dimensions.loginBottomSpace,
            ),
          )
        ],
      ),
    );
  }
}
