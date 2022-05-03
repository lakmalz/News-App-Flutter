import 'package:flutter/material.dart';
import 'package:news_app/utils/styles/theme_extension.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  final Function() onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 42,
        height: 42,
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