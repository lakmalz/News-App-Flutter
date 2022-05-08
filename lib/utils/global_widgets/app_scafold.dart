import 'package:flutter/material.dart';
import 'package:news_app/utils/global_widgets/default_padding.dart';

class AppScaffold extends StatelessWidget {
  AppScaffold(
      {Key? key, required this.body, this.padding = const EdgeInsets.all(16)})
      : super(key: key);
  Widget body;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultPadding(
          edgeInsets: padding,
          child: body,
        ),
      ),
    );
  }
}
