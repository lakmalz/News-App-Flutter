import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_app/screens/home_screen/home_controller.dart';
import 'package:news_app/utils/global_widgets/rounded_icon_button.dart';
import 'package:news_app/utils/global_widgets/search_edit_field.dart';
import 'package:news_app/utils/styles/resources_constant.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Padding(
           padding: const EdgeInsets.only(right: 16),
           child: Row(
             children: [
               const Expanded(child:  SearchEditField()),
                RoundedIconButton(
            onPressed:(){},
            icon: Image.asset(icBell, width: 14, height: 26,)
        ),
             ],
           ),
         ),
       
      ],
    );
  }
}
