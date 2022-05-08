import 'package:flutter/material.dart';
import 'package:news_app/utils/global_widgets/back_icon.dart';
import 'package:news_app/utils/styles/resources.dart';

class BlurBackIcon extends StatelessWidget {
  const BlurBackIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
            top: 42,
            left: 16,
            child: Row(
              children: [
                BackIcon(icon: Resources.icBack),
              ],
            ),
          );
  }
}