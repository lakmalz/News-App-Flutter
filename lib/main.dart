import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:news_app/initial_binding.dart';
import 'package:news_app/routes/app_pages.dart';
import 'package:news_app/services/initial_services.dart';
import 'package:news_app/utils/styles/style.dart';

main() async {
  await initServices();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);
  //TODO Theme management
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primaryColor: Colors.white,
        textTheme: const TextTheme(
          titleMedium: regular14pxTextStyle,
          bodyMedium: regular10pxTextStyle,
        )
      ),
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
      initialRoute: AppPages.initialScreen,
      builder: EasyLoading.init(),
    );
  }
}
