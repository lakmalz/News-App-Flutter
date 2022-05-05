import 'package:get/get.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/utils/base_controller.dart';
import 'package:news_app/utils/constant.dart';

class NewsDetailsController extends BaseController {
  Rxn<ArticlesModel> articleModel = Rxn();

  @override
  void onInit() {
    articleModel.value = Get.arguments?[PARAMS_SELECTED_ARTICLE];
    super.onInit();
  }

  @override
  void onReady() {
    
    super.onReady();
  }
}
