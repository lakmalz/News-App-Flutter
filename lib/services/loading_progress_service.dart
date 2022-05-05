import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/global_widgets/loading_progress_animation.dart';

class LoadingProgressService extends GetxService {
  @override
  void onInit() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false
      ..customAnimation = LoadingProgressAnimation();
    super.onInit();
  }

  show({String? message, bool isVisible = true}) {
    if (isVisible) {
      EasyLoading.show(status: message);
    }
  }

  showSuccess({String? message}) {
    EasyLoading.showSuccess(message ?? '');
  }

  hide() async {
    await EasyLoading.dismiss();
  }

  bool get isVisible => EasyLoading.isShow;
}
