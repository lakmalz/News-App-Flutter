import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/failure.dart';

class BaseController extends GetxController {
  showError(Failure error) {
    final ctx = Get.context;
    if (ctx != null) {
      showDialog(
        context: ctx,
        builder: (_) => _errorAlert(error.title, error.message),
      );
    }
  }

  _errorAlert(String? title, String? message) {
    AlertDialog _ = AlertDialog(
      title: Text(title ?? error),
      content: Text(message ?? somethingWentWrong),
      actions: [
        _okButton,
      ],
    );
  }

  final Widget _okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Get.back();
    },
  );
}
