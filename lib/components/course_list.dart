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
                    'https://r2---sn-4g5e6ns6.googlevideo.com/videoplayback?expire=1621097076&ei=FKafYJ7WLJ6m1gLu9LiwBA&ip=217.195.199.90&id=o-AJU6SRYK6SDrW92H0LzIQ0nDEXxfIpD050x3eSsgOgxz&itag=22&source=youtube&requiressl=yes&vprv=1&mime=video%2Fmp4&ns=fK0IEjmjogtJOt5CuXzv52MF&cnr=14&ratebypass=yes&dur=5711.389&lmt=1620975197103798&fexp=24001373,24007246&c=WEB&txp=6432434&n=EWiKcBEh2uRkxIcy&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRAIgDiGN_eXLibG5nLekvxmaRWoa7l-BH4ehNt2htS8NJsECIEyolwhJmWOQ7M_6jaO8EnRBCfo_AgYeOjfpa4NDxZRH&title=RESIDENT%20EVIL%208%20VILLAGE%20%236%3A%20TI%C3%8AU%20DI%E1%BB%86T%20KIM%20MAO%20S%C6%AF%20V%C6%AF%C6%A0NG%20T%E1%BA%A0%20T%E1%BB%90N%20!!!%20D%E1%BA%ABm%2010%20QU%E1%BA%A2%20M%C3%8CN%20n%C3%B3%20m%E1%BB%9Bi%20o%E1%BA%B3ng%20%3D))))&redirect_counter=1&rm=sn-u0g3uxax3-pnul7l&req_id=17148e38a74ea3ee&cms_redirect=yes&ipbypass=yes&mh=5p&mm=29&mn=sn-4g5e6ns6&ms=rdu&mt=1621086759&mv=m&mvi=2&pl=24&lsparams=ipbypass,mh,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRQIgTfkcXvyiRPJMqTrWr0nZIZYY5ywVwNdUckRIbjAth80CIQC5NhLSAx0Ln3cy5CHseTjD64MX68JvvHzEzN-NUtnxbA%3D%3D',
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
