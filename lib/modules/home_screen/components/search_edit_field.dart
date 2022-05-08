import 'package:flutter/material.dart';
import 'package:news_app/utils/styles/resources.dart';
import 'package:news_app/utils/styles/app_colors.dart';
import 'package:news_app/utils/styles/styles.dart';
import 'package:news_app/utils/extension.dart';

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
      padding: const EdgeInsets.only(right:16),
      child: SizedBox(
        height: 38,
        child: TextField(
          controller: textEditingController,
          textInputAction: TextInputAction.search,
          onSubmitted: (text) {
            context.dimissKeyBoard();
            if (onSubmitted != null) {
              onSubmitted!(text);
            }
          },
          onChanged: onChanged,
          maxLines: 1,
          textAlign: TextAlign.left,
          style:
              Styles.semibold12pxTextStyle(color: AppColors.focusedTextColor),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            suffixIcon: InkWell(
                onTap: onTapSuffixIcon,
                child: Image.asset(
                    isEnable ? Resources.icSearch : Resources.icCancel)),
            hintText: Resources.hintText,
            hintStyle: Styles.semibold12pxTextStyle(
                color: AppColors.greyHintTextColor),
            focusedBorder: foucuedBorder(context),
            enabledBorder: enabledBorder(context),
            border: enabledBorder(context),
          ),
        ),
      ),
    );
  }

  enabledBorder(BuildContext context) => OutlineInputBorder(
      borderSide:
          BorderSide(color: AppColors.greyHintTextColor.withOpacity(0.2)),
      borderRadius: BorderRadius.circular(25.0));

  foucuedBorder(BuildContext context) => OutlineInputBorder(
      borderSide:
          BorderSide(color: AppColors.greyHintTextColor.withOpacity(0.5)),
      borderRadius: BorderRadius.circular(25.0));
}
