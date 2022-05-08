import 'package:flutter/material.dart';
import 'package:news_app/utils/global_widgets/v_spacer.dart';
import 'package:news_app/utils/styles/dimensions.dart';

class RoundedDescription extends StatelessWidget {
  const RoundedDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.detailTopImageHeight - 20,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: Colors.grey.shade100,
                ),
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  children: const [
                    VSpacer(space: 10),
                  ],
                ),
              ));
  }
}