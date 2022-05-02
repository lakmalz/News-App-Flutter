import 'package:get/get.dart';
import 'package:news_app/data/remote/api_client.dart';
import 'package:news_app/data/remote/network_manager.dart';

class InitialBinding extends Bindings {
 
  @override
  dependencies() {
    Get.lazyPut(() => _buildApiClient(), fenix: true);
  }

  ApiClient _buildApiClient() {
    final networkManager = NetworkManager(baseUrl: 'https://newsapi.org/v2');
    return ApiClient(networkManager.dio);
  }
}
