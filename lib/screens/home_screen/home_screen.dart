import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_app/screens/home_screen/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Home',
      style: Theme.of(context).textTheme.titleMedium?.apply(
            color: Colors.green,
          ),
    );
  }
}
