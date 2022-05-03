import 'package:flutter/material.dart';
import 'package:news_app/utils/styles/theme_extension.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.width = 34,
    this.height = 34
  }) : super(key: key);

  final Function() onPressed;
  final Widget icon;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          shape: const CircleBorder(),
          gradient: context.buttonLinearGradient,
        ),
        child: MaterialButton(
          padding: const EdgeInsets.all(0),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: const CircleBorder(),
          child: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}