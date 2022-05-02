import 'package:get/get.dart';
import 'package:news_app/services/loading_progress_service.dart';

Future initServices() async{
    await Get.putAsync(() async => LoadingProgressService());
}