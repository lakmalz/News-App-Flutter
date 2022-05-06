import 'package:get/get.dart';
import 'package:news_app/data/local/app_database.dart';
import 'package:news_app/data/remote/api_client.dart';
import 'package:news_app/data/remote/network_manager.dart';
import 'package:news_app/utils/constant.dart';

class InitialBinding extends Bindings {
  @override
  dependencies() async {
    final database = await $FloorAppDatabase.databaseBuilder(dbName).build();
    final userDao = database.userDao;

    Get.lazyPut(() => userDao);
    Get.lazyPut(() => _buildApiClient(), fenix: true);
  }

  ApiClient _buildApiClient() {
    final networkManager = NetworkManager(baseUrl: 'https://newsapi.org/v2');
    return ApiClient(networkManager.dio);
  }
}
