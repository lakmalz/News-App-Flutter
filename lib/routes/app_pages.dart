import 'package:get/get.dart';
import 'package:news_app/routes/app_routes.dart';
import 'package:news_app/screens/dashboard/dashboard_binding.dart';
import 'package:news_app/screens/dashboard/dashboard_screen.dart';
import 'package:news_app/screens/news_list/news_list_binding.dart';
import 'package:news_app/screens/news_list/news_list_screen.dart';

class AppPages{
  AppPages._();

static const initialScreen = Routes.dashboardScreen;
static final routes = [
    GetPage(
      name: Routes.dashboardScreen,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.newsListScreen,
      page: () => const NewsListScreen(),
      binding: NewsListBinding(),
    ),
  ];
}