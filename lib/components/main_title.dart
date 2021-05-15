import 'package:course_app/utils/constants.dart';
import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: primaryColor,
          ),
        ),
        Text(
          'View all',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xffFFB347),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
