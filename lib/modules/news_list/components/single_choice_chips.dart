import 'package:flutter/material.dart';
import 'package:news_app/data/models/selectable_chip_model.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/styles.dart';

class SingleChoiceChips extends StatefulWidget {
  SingleChoiceChips(
      {Key? key, required this.list, required this.onItemSelected, this.selectedKey})
      : super(key: key);
  List<SelectableChipModel> list;
  void Function(String?) onItemSelected;
  String? selectedKey;
  int? selectedIndex;

  @override
  State<SingleChoiceChips> createState() => _SingleChoiceChipsState();
}

class _SingleChoiceChipsState extends State<SingleChoiceChips> {
  

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 8,
        children: List<Widget>.generate(
          widget.list.length,
          (int index) {
            final isSelectd = (getSelectedKeyAt() == index);
            return FilterChip(
                label: Text(widget.list[index].value,
                    style: Styles.semibold12pxTextStyle(
                        color: isSelectd
                            ? AppColors.whiteColor
                            : AppColors.blackColor)),
                selectedColor: AppColors.primaryColor.withOpacity(0.8),
                backgroundColor: Colors.transparent,
                showCheckmark: false,
                shape: StadiumBorder(
                  side: BorderSide(color: AppColors.borderColor),
                ),
                selected: isSelectd,
                onSelected: (selected) {
                  widget.selectedKey = widget.list[index].key;
                  widget.onItemSelected(widget.selectedKey);
                  setState(() {
                    widget.selectedIndex = selected ? index : null;
                  });
                });
          },
        ).toList());
  }

  int getSelectedKeyAt(){
    return widget.list.indexWhere((element) => element.key == widget.selectedKey);
  }
}
