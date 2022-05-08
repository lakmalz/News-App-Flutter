import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/services/loading_progress_service.dart';
import 'package:news_app/utils/styles/alert_message_helper.dart';

class BaseController extends GetxController with AlertHelper {
  final LoadingProgressService loading = Get.find();
}
