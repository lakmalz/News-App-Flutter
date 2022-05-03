import 'package:flutter/material.dart';

class HSpacer extends StatelessWidget {
  const HSpacer({Key? key, this.space = 2}) : super(key: key);
  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: space,);
  }
}