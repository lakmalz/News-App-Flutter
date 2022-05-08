import 'package:flutter/material.dart';
import 'package:news_app/utils/styles/dimensions.dart';

class DescriptionContainer extends StatelessWidget {
  const DescriptionContainer({Key? key, this.content}) : super(key: key);
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 0,
        right: 0,
        top: Dimensions.detailTopImageHeight + 56,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(content ?? ''),
                ],
              ),
            ),
          ),
        );
  }
}