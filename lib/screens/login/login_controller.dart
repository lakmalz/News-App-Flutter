import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_app/routes/app_pages.dart';
import 'package:news_app/routes/app_routes.dart';

class LoginController extends GetxController{


  void onTapRegistration() {
    Get.toNamed(Routes.registrationScreen);
  }
}