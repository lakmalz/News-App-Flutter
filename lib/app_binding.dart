import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app/config/app_config.dart';
import 'package:news_app/data/remote/api_client.dart';
import 'package:news_app/data/remote/network_manager.dart';

class AppBinding extends Bindings {
  AppBinding( this.context);
  final BuildContext context;
  
  @override
  dependencies() async {
    final appConfig = AppConfig.of(context);
    final networkManager = NetworkManager(baseUrl: appConfig?.baseUrl??'');
    Get.lazyPut(() => ApiClient(networkManager.dio), fenix: true);
  }
}
