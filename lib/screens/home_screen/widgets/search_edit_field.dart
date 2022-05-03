import 'package:flutter/material.dart';
import 'package:news_app/utils/styles/resources_constant.dart';
import 'package:news_app/utils/styles/theme_extension.dart';
class SearchEditField extends StatelessWidget {
  const SearchEditField({
    Key? key,
    this.onChanged,
    this.onTap
  }) : super(key: key);

  final Function(String)? onChanged;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 34,
        child: TextField(
          onChanged: onChanged,
          onTap: onTap,
          maxLines: 1,
          textAlign: TextAlign.left,
          style: context.semibold12pxTextStyle(context.focusedTextColor),
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric( horizontal: 16),
            suffixIcon: Image.asset(icSearch),
            hintText: hintText,
            hintStyle: context.semibold12pxTextStyle(context.greyHintTextColor),
            focusedBorder: foucuedBorder(context),
            enabledBorder: enabledBorder(context),
            border: enabledBorder(context),
          ),
        ),
      ),
    );
  }

  enabledBorder(BuildContext context)=>OutlineInputBorder(
                borderSide: BorderSide(color:  context.greyHintTextColor.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(25.0));

  foucuedBorder(BuildContext context)=>OutlineInputBorder(
                borderSide: BorderSide(color:  context.greyHintTextColor.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(25.0));
}
