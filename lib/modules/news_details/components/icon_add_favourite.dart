import 'package:flutter/material.dart';
import 'package:news_app/utils/global_widgets/rounded_icon_button.dart';
import 'package:news_app/utils/styles/resources.dart';

class IconAddFavourite extends StatelessWidget {
  const IconAddFavourite({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 44,
      right: 16,
      child: RoundedIconButton(
        height: 56,
        width: 56,
          onPressed: () {},
          icon: Image.asset(Resources.icAddFavourite),
        ),
    );
  }
}