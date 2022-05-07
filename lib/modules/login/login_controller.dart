import 'package:get/get.dart';
import 'package:news_app/data/repository/auth_respository.dart';
import 'package:news_app/routes/app_routes.dart';
import 'package:news_app/services/loading_progress_service.dart';
import 'package:news_app/utils/base_controller.dart';
import 'package:news_app/utils/styles/resources.dart';
import 'package:news_app/utils/validator.dart';

class LoginController extends BaseController {
  final AuthRepository _userRepository = Get.find();

  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString errEmail = ''.obs;
  RxString errPassword = ''.obs;
  RxBool isEnableButton = false.obs;

  @override
  void onInit() {
    ever(email, (String value) {
      errEmail(Validator().email(value));
    });
    ever(password, (String value) {
      errPassword(Validator().notEmpty(value, Resources.hintTextPassword));
    });
    everAll([email,password], (value){
      enableLoginButton();
    });
    super.onInit();
  }
  
  // Login form validate
  // Login Button enble and disable if the form valid
  enableLoginButton() {
    if (errEmail.value.isEmpty &&
        errPassword.isEmpty &&
        password.isNotEmpty &&
        email.isNotEmpty) {
      isEnableButton.value = true;
    } else {
      isEnableButton.value = false;
    }
  }

  // Check user is available in the local database
  // Show error if user credentials are incorrect
  // Navigate to dashboard if user credentials are correct
  userLogIn(String email, String password) async {
    loadingProgress.show();
    await Future.delayed(const Duration(seconds: 4));
    final response = await _userRepository.userAuthentication(email, password);
    loadingProgress.hide();
    response.fold((error) => showError(error), (user) => navigateToDashboard());
  }

  void onTapSignin(){
    userLogIn(email.value, password.value);
  }

  void onTapSignup() async {
    Get.toNamed(Routes.registrationScreen);
  }

  navigateToDashboard() {
    Get.offAllNamed(Routes.dashboardScreen);
  }
}
