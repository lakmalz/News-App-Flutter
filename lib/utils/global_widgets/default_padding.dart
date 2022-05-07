import 'package:flutter/material.dart';

class DefaultPadding extends StatelessWidget {
  const DefaultPadding({
    Key? key,
    required this.child,
    this.edgeInsets = const EdgeInsets.all(16),
  }) : super(key: key);

  final EdgeInsets edgeInsets;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets,
      child: child,
    );
  }
}
