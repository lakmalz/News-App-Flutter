import 'package:get/get.dart';
import 'package:news_app/data/repository/auth_respository.dart';
import 'package:news_app/routes/app_routes.dart';
import 'package:news_app/modules/base/base_controller.dart';
import 'package:news_app/utils/styles/resources.dart';
import 'package:news_app/utils/validator.dart';

class RegistrationController extends BaseController {
  final AuthRepository _authRepo = Get.find();
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString errName = ''.obs;
  RxString errEmail = ''.obs;
  RxString errPassword = ''.obs;
  RxBool isEnableButton = false.obs;
  RxBool enableObscureText = true.obs;

  @override
  void onInit() {
    dataListeners();
    super.onInit();
  }

  dataListeners() {
    final validator = Validator();
    ever(name, (String value) {
      errName.value = validator.notEmpty(value, Resources.hintTextName);
    });
    ever(email, (String value) {
      errEmail.value = validator.email(value);
    });
    ever(password, (String value) {
      errPassword.value = validator.notEmpty(value, Resources.hintTextPassword);
    });
    everAll([email, name, password], (value) {
      enableSignupButton();
    });
  }

  // Signup button enable and disable conditions
  enableSignupButton() {
    isEnableButton.value = errName.value.isEmpty &&
        errEmail.isEmpty &&
        errPassword.isEmpty &&
        name.isNotEmpty &&
        password.isNotEmpty &&
        email.isNotEmpty;
  }

  // User registration
  userRegistration(String email, String name, String password) async {
    loading.show();
    var response = await _authRepo.userRegistration(email, name, password);
    await Future.delayed(const Duration(seconds: 2));
    loading.hide();
    response.fold((error) => showError(error), (user) {
      showMessage(Resources.lableSuccess, Resources.successAlertUserRegitration,
          () {
        navigateToLogin();
      });
    });
  }

  onTapSignup() {
    userRegistration(email.value, name.value, password.value);
  }

  navigateToLogin() async {
    Get.offAllNamed(Routes.loginScreen);
  }
}
