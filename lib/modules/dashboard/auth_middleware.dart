import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/routes/app_routes.dart';
import 'package:news_app/modules/auth/auth_controller.dart';

class AuthMiddleware extends GetMiddleware {
  final authController = Get.find<AuthController>();

  @override
  RouteSettings? redirect(String? route) {
    return authController.isAuthenticated
        ? const RouteSettings(name: Routes.dashboardScreen)
        : null;
  }
}
