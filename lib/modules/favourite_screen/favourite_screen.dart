import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_app/modules/favourite_screen/favourite_controller.dart';

class FavouriteScreen extends GetView<FavouriteController> {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  Text('Fav');
  }
}
