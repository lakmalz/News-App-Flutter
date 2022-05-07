import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/data/models/selectable_chip_model.dart';
import 'package:news_app/modules/news_list/components/single_choice_chips.dart';
import 'package:news_app/utils/global_widgets/default_padding.dart';
import 'package:news_app/utils/global_widgets/gradient_button.dart';
import 'package:news_app/utils/global_widgets/v_spacer.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/resources.dart';
import 'package:news_app/utils/styles/styles.dart';

class FilterBottomSheet extends StatelessWidget {
  FilterBottomSheet(
      {Key? key,
      required this.onTapSave,
      required this.selectedCountryKey,
      required this.selectedLanguageKey})
      : super(key: key);
  Function(String?, String?) onTapSave;
  String? selectedCountryKey;
  String? selectedLanguageKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
      ),
      child: Stack(
        //Todo
        // const ModalDragHandle(),
        children: [
          SingleChildScrollView(
            child: DefaultPadding(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VSpacer(space: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Resources.labelFilter,
                        style: Styles.semiBold22pxTextStyle(),
                      ),
                      _buildRestIcon(),
                    ],
                  ),
                  _buildCountryChips(selectedCountryKey),
                  _buildLanguageChips(selectedLanguageKey),
                  const VSpacer(space: 34),
                  GradientButton(
                    isEnable: true,
                    buttonText: Resources.lableSave,
                    onPressed: () {
                      onTapSave(selectedCountryKey, selectedLanguageKey);
                      Get.back();
                    },
                  ),
                  const VSpacer(space: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildCountryChips(String? selectedKey) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VSpacer(space: 16),
        Text(Resources.labelCountry, style: Styles.semibold14pxTextStyle()),
        const VSpacer(space: 8),
        SingleChoiceChips(
          selectedKey: selectedKey,
          onItemSelected: (selectedKey) {
            selectedCountryKey = selectedKey;
          },
          list: Resources.countryList.entries
              .map((e) => SelectableChipModel(key: e.key, value: e.value))
              .toList(),
        ),
      ],
    );
  }

  Column _buildLanguageChips(String? selectedKey) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VSpacer(space: 16),
        Text(Resources.labelLanguage, style: Styles.semibold14pxTextStyle()),
        const VSpacer(space: 8),
        SingleChoiceChips(
          selectedKey: selectedKey,
          onItemSelected: (selectedKey) {
            selectedLanguageKey = selectedKey;
          },
          list: Resources.languageList.entries
              .map((e) => SelectableChipModel(key: e.key, value: e.value))
              .toList(),
        ),
      ],
    );
  }

  OutlinedButton _buildRestIcon() {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        side: BorderSide(width: 1, color: AppColors.blackColor),
      ),
      onPressed: () {},
      icon: Image.asset(Resources.icDelete),
      label: Text(
        Resources.labelReset,
        style: Styles.semibold12pxTextStyle(),
      ),
    );
  }
}
