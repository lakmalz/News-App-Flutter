import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/screens/news_list/news_list_controller.dart';
import 'package:news_app/utils/global_widgets/back_icon.dart';
import 'package:news_app/utils/global_widgets/created_date_text.dart';
import 'package:news_app/utils/global_widgets/v_spacer.dart';
import 'package:news_app/utils/resources_constant.dart';
import 'package:news_app/utils/styles/dimensions.dart';
import 'package:news_app/utils/styles/theme_extension.dart';

const String image =
    'https://images.unsplash.com/photo-1587321645713-32b701e5aa98?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80';

class NewsDetailsScreen extends GetView<NewsListController> {
  const NewsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.detailTopImageHeight,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              )),
            ),
          ),
          Positioned(
            top: 45,
            left: 16,
            child: Row(
              children: const [
                BackIcon(
                  icon: icBack,
                )
              ],
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.detailTopImageHeight - 20,
              child: SingleChildScrollView(
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
                    children: [
                      VSpacer(
                        space: 10,
                      ),
                      // Text(
                      //     'KJ huiasuihpiasiufhaipus fiuhapsu fhuiasdipuf hiuasfiuahspiudf h')
                    ],
                  ),
                ),
              )),
          Positioned(
              left: 0,
              right: 0,
              top: Dimensions.detailTopImageHeight -
                  (Dimensions.detailTopImageHeight / 2.3),
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      height: Dimensions.screenWidth / 2.4,
                      decoration:
                          BoxDecoration(color: Colors.grey.withOpacity(0.6)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CreatedDateText(
                                createdDate: 'Monday, 20 May 2022',
                                color: context.brownColor),
                            VSpacer(space: 10,),
                            
                            Text(
                              'Crypto incerstor shoul be prepared to lose all their monet, BOE governor says',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: context
                                  .newyorkBold16pxTextStyle(context.brownColor),
                            ),
                            VSpacer(space: 10,),
                            Text(
                              'Published by Ryan browns',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context
                                  .extraBold10pxTextStyle(context.brownColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
