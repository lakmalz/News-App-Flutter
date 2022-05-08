import 'package:get/get.dart';
import 'package:news_app/modules/auth/auth_controller.dart';
import 'package:news_app/modules/base/base_controller.dart';
import 'package:news_app/utils/styles/resources.dart';

class ProfileController extends BaseController{
  AuthController authController = Get.find();

  onTapLogout() {
    showMessage(Resources.labelConfirm, Resources.confirmAlertToLogout, (){
      authController.userLogout();
    });
  }
}