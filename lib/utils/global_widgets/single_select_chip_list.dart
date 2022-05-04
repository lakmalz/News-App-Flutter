import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/styles/app_colors.dart';

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
                  activeBgColorList: [AppColors.gradeintEndPrimary],
                  inactiveBgColorList: [AppColors.whiteColor],
                  activeTextColorList: [AppColors.whiteColor],
                  inactiveTextColorList: [AppColors.brownColor],
                  inactiveBorderColorList: [AppColors.greyColor.withOpacity(0.2)],
                  listOfChipIndicesCurrentlySeclected: [initialIndex],
                  activeBorderColorList: [AppColors.greyColor.withOpacity(0.2)],
                  extraOnToggle: (va){
                    extraOnToggle(va);
                  },
                );
  }
}