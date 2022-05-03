import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/screens/dashboard/dashboard_controller.dart';
import 'package:news_app/screens/favourite_screen/favourite_screen.dart';
import 'package:news_app/screens/home_screen/home_screen.dart';
import 'package:news_app/screens/profile_screen/profile_screen.dart';
import 'package:news_app/utils/enum.dart';
import 'package:news_app/utils/extension.dart';
import 'package:news_app/utils/global_widgets/floating_bottom_navigation_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Widget> _stack = List.filled(3, const SizedBox());
  final controller = Get.find<DashboardController>();

  @override
  void initState() {
    updateTabContainers(controller.selectedIndex.value);
    ever(controller.selectedIndex, updateTabContainers);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => Container(
              height: Get.height,
              width: Get.width,
              color: Colors.grey.shade100,
              child: Stack(
                children: [
                  IndexedStack(
                    index: controller.selectedIndex(),
                    children: _stack,
                  ),
                  Positioned(
                    bottom: 16,
                    right: 0,
                    left: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingBottomNavigationBar(
                          selectedIndex: controller.selectedIndex.value,
                          onTap: (value) => controller.didPressedOnTab(value),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  updateTabContainers(int _index) {
    if (_index == eBottomNavigation.home.tabIndex) {
      if (_stack[_index] is SizedBox) {
        _stack[_index] = const HomeScreen();
      }
    }
    if (_index == eBottomNavigation.favourite.tabIndex) {
      if (_stack[_index] is SizedBox) {
        _stack[_index] = const FavouriteScreen();
      }
    }
    if (_index == eBottomNavigation.profile.tabIndex) {
      if (_stack[_index] is SizedBox) {
        _stack[_index] = const ProfileScreen();
      }
    }
  }
}

