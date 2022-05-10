import 'package:flutter/material.dart';
import 'package:news_app/config/app_config.dart';
import 'package:news_app/data/remote/api_constant.dart';
import 'package:news_app/di.dart';
import 'package:news_app/main.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await DenpendencyInjection.init();
  
  final configuredApp = AppConfig(
    baseUrl: APIConstant.baseUrlDev,
    child: const Application(),
  );
  return runApp(configuredApp);
}
