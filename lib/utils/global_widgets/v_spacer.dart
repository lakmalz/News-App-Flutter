import 'package:flutter/material.dart';

class VSpacer extends StatelessWidget {
  const VSpacer({Key? key,this.space = 2}) : super(key: key);
  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space,);
  }
}