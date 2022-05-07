import 'package:flutter/material.dart';
import 'package:news_app/utils/styles/resources.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/styles.dart';

class SearchEditField extends StatelessWidget {
  SearchEditField(
      {Key? key,
      this.isEnable = true,
      this.onChanged,
      this.onSubmitted,
      this.onTapSuffixIcon,
      this.initialText})
      : super(key: key);

  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function()? onTapSuffixIcon;
  final bool isEnable;
  final String? initialText;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textEditingController.text = initialText ?? '';
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 38,
        child: TextField(
          controller: textEditingController,
          enableInteractiveSelection: isEnable,
          focusNode: AlwaysDisabledFocusNode(isEnable: isEnable),
          textInputAction: TextInputAction.search,
          onSubmitted: onSubmitted,
          onChanged: onChanged,
          maxLines: 1,
          textAlign: TextAlign.left,
          style: Styles.semibold12pxTextStyle(color:AppColors.focusedTextColor),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            suffixIcon: InkWell(
                onTap: onTapSuffixIcon,
                child: Image.asset(isEnable ? Resources.icSearch : Resources.icCancel)),
            hintText: Resources.hintText,
            hintStyle: Styles.semibold12pxTextStyle(color:AppColors.greyHintTextColor),
            focusedBorder: foucuedBorder(context),
            enabledBorder: enabledBorder(context),
            border: enabledBorder(context),
          ),
        ),
      ),
    );
  }

  enabledBorder(BuildContext context) => OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greyHintTextColor.withOpacity(0.2)),
      borderRadius: BorderRadius.circular(25.0));

  foucuedBorder(BuildContext context) => OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.greyHintTextColor.withOpacity(0.5)),
      borderRadius: BorderRadius.circular(25.0));
}

// This use to the Textfeild enable and disable purpose.
// Because suffic icon click event will not work when 'enable = false'
class AlwaysDisabledFocusNode extends FocusNode {
  AlwaysDisabledFocusNode({this.isEnable = true});
  final bool isEnable;
  @override
  bool get hasFocus => isEnable;
}
