import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:news_app/modules/auth/auth_controller.dart';
import 'package:news_app/app_binding.dart';
import 'package:news_app/routes/app_pages.dart';
import 'package:news_app/di.dart';

// main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await DenpendencyInjection.init();
//   runApp(const Application());
// }

class Application extends GetView<AuthController> {
  const Application({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, 
      initialBinding: AppBinding(context),
      getPages: AppPages.routes,
      initialRoute: AppPages.initialScreen,
      builder: EasyLoading.init(),
    );
  }
}
