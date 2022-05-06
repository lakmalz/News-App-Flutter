import 'package:get/get.dart';
import 'package:news_app/data/repository/user_respository.dart';
import 'package:news_app/screens/login/login_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => UserRepository());
    Get.lazyPut(() => LoginController());
  }

}