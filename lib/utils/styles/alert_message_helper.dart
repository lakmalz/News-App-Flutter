import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/failure.dart';
import 'package:news_app/utils/styles/resources.dart';

mixin AlertHelper {
  showError(Failure error) {
    final ctx = Get.context;
    if (ctx != null) {
      showDialog(
        context: ctx,
        builder: (_) => _errorAlert(error.title, error.message),
      );
    }
  }

  showConfirmation(String message, Function onTapConfirm) {
    final ctx = Get.context;
    if (ctx != null) {
      showDialog(
        context: ctx,
        builder: (_) => _showConfirmationAlert(
            Resources.labelConfirm, message, onTapConfirm),
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

  AlertDialog _showConfirmationAlert(
      String? title, String? message, Function onTapConfirm) {
    AlertDialog alert = AlertDialog(
      title: Text(title ?? Resources.error),
      content: Text(message ?? Resources.somethingWentWrong),
      actions: [
        TextButton(
          child: Text(Resources.labelConfirm),
          onPressed: () => onTapConfirm(),
        )
      ],
    );
    return alert;
  }

  final Widget _okButton = TextButton(
    child: Text(Resources.labelOk),
    onPressed: () {
      Get.back();
    },
  );
}
