import 'package:get/get.dart';
import 'package:news_app/data/repository/auth_respository.dart';
import 'package:news_app/modules/base/base_controller.dart';
import 'package:news_app/routes/app_routes.dart';

class AuthController extends BaseController {
  AuthController(this.isAuthenticated, this.userEmail);
  final AuthRepository _authRepository = Get.find();
  bool isAuthenticated = false;
  String userEmail;

  // Check user is available in the local database
  // Show error if user credentials are incorrect
  // Navigate to dashboard if user credentials are correct
  userLogIn(String email, String password) async {
    loading.show();
    await Future.delayed(const Duration(seconds: 4));
    final response = await _authRepository.userAuthentication(email, password);
    loading.hide();
    response.fold(
      (error) => showError(error),
      (user) {
        isAuthenticated = true;
        userEmail = user?.email ?? '';
        navigateToDashboard();
      },
    );
  }

  // Perform user logout
  userLogout() async {
    loading.show();
    await Future.delayed(const Duration(seconds: 2));
    await _authRepository.userLogout();
    isAuthenticated = false;
    navigateToLogin();
    loading.hide();
  }

  navigateToDashboard() {
    Get.offAllNamed(Routes.dashboardScreen);
  }

  navigateToLogin() {
    Get.offAllNamed(Routes.loginScreen);
  }
}
