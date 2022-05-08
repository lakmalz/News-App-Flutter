import 'package:get/get.dart';
import 'package:news_app/modules/auth/auth_controller.dart';
import 'package:news_app/routes/app_routes.dart';
import 'package:news_app/modules/base/base_controller.dart';
import 'package:news_app/utils/styles/resources.dart';
import 'package:news_app/utils/validator.dart';

class LoginController extends BaseController {
  final AuthController _authController = Get.find();

  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString errEmail = ''.obs;
  RxString errPassword = ''.obs;
  RxBool isEnableButton = false.obs;

  @override
  void onInit() {
    dataListeners();
    super.onInit();
  }

  // Field validation values listeners
  dataListeners() {
    final validator = Validator();
    ever(email, (String value) {
      errEmail(validator.email(value));
    });
    ever(password, (String value) {
      errPassword(validator.notEmpty(value, Resources.hintTextPassword));
    });
    everAll([email, password], (value) {
      enableLoginButton();
    });
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

  void onTapSignin() {
    _authController.userLogIn(email.value, password.value);
  }

  void onTapSignup() async {
    Get.toNamed(Routes.registrationScreen);
  }
}
