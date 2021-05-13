import 'package:course_app/components/course_card.dart';
import 'package:flutter/material.dart';

class CoursesList extends StatelessWidget {
  const CoursesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 17),
      child: SingleChildScrollView(
        child: SizedBox(
          height: 340,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CourseCard(
                title: 'Finding Co-Founder in early days',
                author: 'Ankur Warikoo',
                firstColor: Color(0xfffFFAC71),
                secondColor: Color(0xfffFF8450),
              ),
              CourseCard(
                title: 'Finding Co-Founder in early days',
                author: 'Ankur Warikoo',
                firstColor: Color(0xfff02AAB0),
                secondColor: Color(0xfff00CDAC),
              ),
              CourseCard(
                title: 'Finding Co-Founder in early days',
                author: 'Ankur Warikoo',
                firstColor: Color(0xfffFFAC71),
                secondColor: Color(0xfffFF8450),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
