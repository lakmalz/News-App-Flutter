import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  AppConfig({
    Key? key,
    required this.baseUrl,
    required this.child,
  }) : super(key: key, child: child);
  final String? baseUrl;
  final Widget child;


  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  String? get baseUrlPath => baseUrl;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
