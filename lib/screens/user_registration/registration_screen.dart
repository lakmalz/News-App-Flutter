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
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                Resources.labelCreateAccount,
                style: Styles.bold32pxTextStyle(AppColors.primaryColor),
              ),
              const Expanded(
                child: VSpacer(
                  space: 80,
                ),
              ),
              Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InputField(
                        errorMessage: controller.errName(),
                        onChanged: (text) {
                          controller.name.value = text;
                        },
                        hintText: Resources.hintTextName),
                    const VSpacer(
                      space: 16,
                    ),
                    InputField(
                        errorMessage: controller.errEmail.value,
                        onChanged: (text) {
                          controller.email.value = text;
                        },
                        hintText: Resources.hintTextEmail),
                    const VSpacer(
                      space: 16,
                    ),
                    InputField(
                        errorMessage: controller.errPassword(),
                        onChanged: (text) {
                          controller.password.value = text;
                        },
                        hintText: Resources.hintTextPassword),
                  ],
                ),
              ),
              const VSpacer(
                space: 24,
              ),
              Obx(
                () => GradientButton(
                  isEnable: controller.isEnableButton(),
                  buttonText: Resources.labelSignup,
                  onPressed: () => controller.onTapSignup(),
                ),
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
      ),
    );
  }
}
