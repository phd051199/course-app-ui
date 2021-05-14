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
                    'https://r6---sn-8qj-nbos7.googlevideo.com/videoplayback?expire=1621004446&ei=PjyeYMmiGYCFjuMP9pG2oAc&ip=18.139.173.12&id=o-AMbJBijWkk2Jhp-nN7cigZ-bB-IYbjKtr2ZaJZU43Nx1&itag=18&source=youtube&requiressl=yes&vprv=1&mime=video%2Fmp4&ns=v-i1TRQJ973o2xZkvpcniuEF&gir=yes&clen=138050973&ratebypass=yes&dur=4485.421&lmt=1592042651732901&fexp=24001373,24007246&c=WEB&txp=5531432&n=mCJKZlc_InPPiRKL_pBh&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRAIgJfo8AEvyM-jIuyPf2hbwJ-XfduxNi_8FQLpPNPa5p9MCIE121aOpzSvNPO91uLBzoT_VszkrEzQ6uSaOJS_tRlzZ&redirect_counter=1&rm=sn-npozy76&req_id=d4d0212f2422a3ee&cms_redirect=yes&ipbypass=yes&mh=Hh&mip=14.160.225.94&mm=31&mn=sn-8qj-nbos7&ms=au&mt=1620982607&mv=m&mvi=6&pl=23&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRQIgRGeOUptxV_3N4Hz68-JKkB2PZQNJLmAuBy3QHLCqaKYCIQD1wu5EuH_oD31WrpXiRXKmdZAD21ricGBoQpqwblh2Bg%3D%3D',
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
