import 'package:get/get.dart';
import 'package:news_app/screens/user_registration/registration_controller.dart';

class RegistrationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationController());
  }

}