import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_app/screens/home_screen/home_controller.dart';
import 'package:news_app/utils/global_widgets/rounded_icon_button.dart';
import 'package:news_app/utils/global_widgets/search_widget.dart';
import 'package:news_app/utils/styles/theme_extension.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Row(
           children: [
             const SearchWidget(),
           ],
         ),
        RoundedIconButton(
          onPressed:(){},
          icon: Image.asset('assets/images/ic_bell.png')
        ),
      ],
    );
  }
}
