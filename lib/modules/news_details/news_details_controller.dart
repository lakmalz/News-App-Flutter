import 'package:get/get.dart';
import 'package:news_app/data/models/articles_model.dart';
import 'package:news_app/utils/constant.dart';
import 'package:news_app/modules/base/base_controller.dart';

class NewsDetailsController extends BaseController {
  Rxn<ArticlesModel> articleModel = Rxn();

  @override
  void onInit() {
    articleModel.value = Get.arguments?[paramsSelectedArticle];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
