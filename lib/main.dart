import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:news_app/routes/app_routes.dart';
import 'package:news_app/screens/login/auth_controller.dart';
import 'package:news_app/utils/initial_binding.dart';
import 'package:news_app/routes/app_pages.dart';
import 'package:news_app/services/initial_services.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initProviders();
  runApp(const Application());
}

class Application extends GetView<AuthController> {
  const Application({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
      initialRoute:
          controller.isAuthenticated ? Routes.dashboardScreen : Routes.loginScreen,
      builder: EasyLoading.init(),
    );
  }
}
