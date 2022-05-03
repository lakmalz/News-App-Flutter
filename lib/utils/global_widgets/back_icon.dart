import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackIcon extends StatelessWidget {
  const BackIcon(
      {Key? key,
      required this.icon,
      this.backgrounColor = Colors.white,
      this.iconColor = Colors.black,
      this.size = 38})
      : super(key: key);

  final String icon;
  final Color backgrounColor;
  final Color iconColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2.7),
          color: backgrounColor.withAlpha(80)
        ),
        child: Image.asset(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
