import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:news_app/data/local/app_database.dart';
import 'package:news_app/data/preferences/secure_storage.dart';
import 'package:news_app/data/remote/api_client.dart';
import 'package:news_app/data/remote/api_constant.dart';
import 'package:news_app/data/remote/network_manager.dart';
import 'package:news_app/data/repository/auth_respository.dart';
import 'package:news_app/modules/auth/auth_controller.dart';
import 'package:news_app/services/loading_progress_service.dart';
import 'package:news_app/utils/constant.dart';

class DenpendencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() async => LoadingProgressService());
 
    final database = await $FloorAppDatabase.databaseBuilder(dbName).build();
    final userDao = database.userDao;
    final secureStorage =
        SecureStorage(secureStorage: const FlutterSecureStorage());

    Get.lazyPut(() => secureStorage);
    Get.lazyPut(() => userDao);
    Get.lazyPut(() => AuthRepository());

    AuthRepository authRepo = Get.find();
    final isAthenticated = await authRepo.isUserLoggedIn();
    final email = await authRepo.getLoggedUserEmail();
    Get.lazyPut(() => AuthController(isAthenticated, email ?? ''));
  }
}
