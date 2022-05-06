import 'package:get/get.dart';
import 'package:news_app/data/repository/auth_respository.dart';
import 'package:news_app/routes/app_routes.dart';
import 'package:news_app/services/loading_progress_service.dart';
import 'package:news_app/utils/base_controller.dart';
import 'package:news_app/utils/styles/resources.dart';
import 'package:news_app/utils/validator.dart';

class RegistrationController extends BaseController {
  final AuthRepository _userRepository = Get.find();
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString errName = ''.obs;
  RxString errEmail = ''.obs;
  RxString errPassword = ''.obs;
  RxBool isEnableButton = false.obs;

  @override
  void onInit() {
    ever(name, (String value) {
      errName.value = Validator().notEmpty(value, Resources.hintTextName);
    });
    ever(email, (String value) {
      errEmail.value = Validator().email(value);
    });
    ever(password, (String value) {
      errPassword.value =
          Validator().notEmpty(value, Resources.hintTextPassword);
    });
    everAll([email, name, password], (value) {
      enableSignupButton();
    });
    super.onInit();
  }

  enableSignupButton() {
    if (errName.value.isEmpty &&
        errEmail.isEmpty &&
        errPassword.isEmpty &&
        name.isNotEmpty &&
        password.isNotEmpty &&
        email.isNotEmpty) {
      isEnableButton.value = true;
    } else {
      isEnableButton.value = false;
    }
  }

  // User registration
  userRegistration(String email, String name, String password) async {
    loadingProgress.show();

    final response = await _userRepository.userRegistration(email, name, password);
    await Future.delayed(const Duration(seconds: 2));
    loadingProgress.hide();
    response.fold((error) => showError(error), (user) => navigateToLogin());
  }

  onTapSignup() {
    userRegistration(email.value, name.value, password.value);
  }

  navigateToLogin() async {
    Get.offAllNamed(Routes.loginScreen);
  }
}
