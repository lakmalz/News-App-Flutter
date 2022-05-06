import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/services/loading_progress_service.dart';
import 'package:news_app/utils/failure.dart';
import 'package:news_app/utils/styles/resources.dart';

class BaseController extends GetxController {
  final LoadingProgressService loadingProgress = Get.find();
  showError(Failure error) {
    final ctx = Get.context;
    if (ctx != null) {
      showDialog(
        context: ctx,
        builder: (_) => _errorAlert(error.title, error.message),
      );
    }
  }

  AlertDialog _errorAlert(String? title, String? message) {
    AlertDialog alert = AlertDialog(
      title: Text(title ?? Resources.error),
      content: Text(message ?? Resources.somethingWentWrong),
      actions: [
        _okButton,
      ],
    );
    return alert;
  }

  final Widget _okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Get.back();
    },
  );
}
