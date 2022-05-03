import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/styles/theme_extension.dart';

class SingleSelectChipList extends StatelessWidget {
  const SingleSelectChipList({Key? key,required this.initialIndex, required this.chipString, required this.extraOnToggle}) : super(key: key);
  final List<String> chipString;
  final Function(int) extraOnToggle;
  final int initialIndex;
  
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
                  listOfChipIndicesCurrentlySeclected: [initialIndex],
                  activeBorderColorList: [context.greyColor.withOpacity(0.2)],
                  extraOnToggle: (va){
                    extraOnToggle(va);
                  },
                );
  }
}