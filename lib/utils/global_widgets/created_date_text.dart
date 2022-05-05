import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/utils/styles/styles.dart';

class CreatedDateText extends StatelessWidget {
  const CreatedDateText({Key? key, this.createdDate, this.color = Colors.white})
      : super(key: key);
  final String? createdDate;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      formatedDate(createdDate),
      textAlign: TextAlign.right,
      style: Styles.semibold12pxTextStyle(color),
    );
  }



  String formatedDate(String? date) {
    if (date == null) return '';
    try {
      return DateFormat.yMMMMEEEEd().format(DateTime.parse(date));
    } on FormatException catch (_) {
      return '';
    }
  }
}
