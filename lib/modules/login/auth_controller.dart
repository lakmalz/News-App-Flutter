import 'package:get/get.dart';
import 'package:news_app/data/repository/auth_respository.dart';
import 'package:news_app/routes/app_routes.dart';
import 'package:news_app/utils/base_controller.dart';

class AuthController extends BaseController {
  AuthController(this.isAuthenticated, this.userEmail);
  AuthRepository authRepository = Get.find();

  bool isAuthenticated = false;
  String userEmail;
  
  // Perform user logout
  userLogout()async{
    loadingProgress.show();
    await Future.delayed(const Duration(seconds: 2));
    await authRepository.userLogout();
    Get.offAllNamed(Routes.loginScreen);
    loadingProgress.hide();
  }


}
