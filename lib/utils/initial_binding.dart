import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:news_app/data/local/app_database.dart';
import 'package:news_app/data/preferences/secure_storage.dart';
import 'package:news_app/data/remote/api_client.dart';
import 'package:news_app/data/remote/network_manager.dart';
import 'package:news_app/data/repository/auth_respository.dart';
import 'package:news_app/screens/login/auth_controller.dart';
import 'package:news_app/utils/constant.dart';

class InitialBinding extends Bindings {
  @override
  dependencies() async {
    Get.lazyPut(() => _buildApiClient(), fenix: true);
  }

  ApiClient _buildApiClient() {
    final networkManager = NetworkManager(baseUrl: 'https://newsapi.org/v2');
    return ApiClient(networkManager.dio);
  }
}
