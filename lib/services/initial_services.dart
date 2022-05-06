import 'package:get/get.dart';
import 'package:news_app/data/local/app_database.dart';
import 'package:news_app/services/loading_progress_service.dart';
import 'package:news_app/utils/constant.dart';

Future initServices() async {
  
  await Get.putAsync(() async => LoadingProgressService());
}
