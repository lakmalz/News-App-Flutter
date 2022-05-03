import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/styles/theme_extension.dart';

class SingleSelectChipList extends StatelessWidget {
  const SingleSelectChipList({Key? key, required this.chipString, required this.extraOnToggle}) : super(key: key);
  final List<String> chipString;
  final Function(int)? extraOnToggle;
  
  @override
  Widget build(BuildContext context) {
    //TODO
    return ChipList(
                  listOfChipNames: chipString,
                  activeBgColorList: [context.gradeintEndPrimary],
                  inactiveBgColorList: [context.whiteColor],
                  activeTextColorList: [context.whiteColor],
                  inactiveTextColorList: [context.brownColor],
                  inactiveBorderColorList: [context.greyColor.withOpacity(0.2)],
                  listOfChipIndicesCurrentlySeclected: [0],
                  // listOfChipIndicesCurrentlySeclected: [_currentIndex],
                  activeBorderColorList: [context.greyColor.withOpacity(0.2)],
                  extraOnToggle: extraOnToggle,
                );
  }
}