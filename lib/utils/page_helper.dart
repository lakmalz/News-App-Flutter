import 'package:news_app/utils/constant.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

mixin PageHelper {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
  bool hasMoreData = true;
  int page = 1;

  pageIncrement(int totResult) {
    final pages = totResult / pageSize;
    if (pages > page) {
      page++;
      hasMoreData = true;
      refreshController.loadComplete();
    } else {
      hasMoreData = false;
      refreshController.loadNoData();
    }
  }
}
