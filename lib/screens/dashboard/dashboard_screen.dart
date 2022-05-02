import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/screens/dashboard/dashboard_controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ListView.separated(
          itemBuilder: (_, index) {
            final item = controller.articleList[index];
            return Text(item.title ?? '');
          },
          separatorBuilder: (_, index) => const Divider(),
          itemCount: controller.articleList.length,
        ),
      ),
    );
  }
}
