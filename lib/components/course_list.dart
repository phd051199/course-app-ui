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
          height: 330,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CourseCard(
                title: 'Finding Co-Founder in early days',
                author: 'Ankur Warikoo',
                videoLink:
                    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                firstColor: Color(0xfffFFAC71),
                secondColor: Color(0xfffFF8450),
              ),
              CourseCard(
                title: 'Finding Co-Founder in early days',
                author: 'Ankur Warikoo',
                videoLink:
                    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
                firstColor: Color(0xfff02AAB0),
                secondColor: Color(0xfff00CDAC),
              ),
              CourseCard(
                title: 'Finding Co-Founder in early days',
                author: 'Ankur Warikoo',
                videoLink:
                    'https://dl.dropbox.com/s/df2d2gf1dvnr5uj/Sample_1280x720_mp4.mp4',
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
