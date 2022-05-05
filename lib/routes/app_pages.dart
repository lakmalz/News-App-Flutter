import 'package:get/get.dart';
import 'package:news_app/routes/app_routes.dart';
import 'package:news_app/screens/dashboard/dashboard_binding.dart';
import 'package:news_app/screens/dashboard/dashboard_screen.dart';
import 'package:news_app/screens/login/login_binding.dart';
import 'package:news_app/screens/login/login_screen.dart';
import 'package:news_app/screens/news_details/news_details_binding.dart';
import 'package:news_app/screens/news_details/news_details_screen.dart';
import 'package:news_app/screens/news_list/news_list_binding.dart';
import 'package:news_app/screens/news_list/news_list_screen.dart';
import 'package:news_app/screens/user_registration/registration_binding.dart';
import 'package:news_app/screens/user_registration/registration_screen.dart';

class AppPages{
  AppPages._();

static const initialScreen = Routes.loginScreen;
static final routes = [
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.registrationScreen,
      page: () => const RegistrationScreen(),
      binding: RegistrationBinding(),
    ),
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
    GetPage(
      name: Routes.newsDetailsScreen,
      page: () => const NewsDetailsScreen(),
      binding: NewsDetailsBinding(),
    ),
  ];
}