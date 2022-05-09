import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/styles/resources.dart';

class EyeIcon extends StatelessWidget {
  EyeIcon({Key? key, required this.enableObscureText}) : super(key: key);
  RxBool enableObscureText = true.obs;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(enableObscureText()
          ? Resources.icEyeOff
          : Resources.icEye),
      onPressed: () => enableObscureText.toggle(),
    );
  }
}
