import 'package:flutter/material.dart';
import 'package:news_app/utils/styles/theme_extension.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.newline,
      textAlign: TextAlign.left,
      style: context.semibold12pxTextStyle(context.focusedTextColor),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical:0 , horizontal: 16),
        suffixIcon: Image.asset('assets/images/ic_search.png'),
        hintText: 'Dogecoin to the Moon',
        border: OutlineInputBorder(
            borderSide: BorderSide(color: context.borderColor, width: 32.0),
            borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }
}