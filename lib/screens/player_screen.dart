import 'package:course_app/components/player_controls.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../utils/constants.dart';

class PlayerScreen extends StatefulWidget {
  PlayerScreen({Key key, this.videoLink, this.title}) : super(key: key);
  final String videoLink, title;

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.network(widget.videoLink));
  }

  @override
  Widget build(BuildContext context) {
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () => Get.back(),
          ),
        ),
        title: Text(
          'Home',
          style: GoogleFonts.getFont(
            'Montserrat',
            color: primaryColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                  child: Container(
                    child: Text(
                      widget.title,
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                  child: Container(
                    child: Stack(
                      children: [
                        Container(
                          height: !isLandScape ? 225 : double.infinity,
                          child: FlickVideoPlayer(
                            flickManager: flickManager,
                            preferredDeviceOrientation: [
                              DeviceOrientation.landscapeRight,
                              DeviceOrientation.landscapeLeft,
                              DeviceOrientation.portraitUp
                            ],
                            flickVideoWithControls: FlickVideoWithControls(
                              controls: PlayerControls(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ReactButton(
                      icon: Icons.thumb_up_alt_outlined,
                      count: 123,
                    ),
                    ReactButton(
                      icon: Icons.thumb_down_alt_outlined,
                      count: 10,
                    ),
                  ],
                ),
                LanguageDropdown(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xff484848),
                    ),
                    height: 300,
                    child: ListView(
                      children: [
                        SubTitle(
                          time: '0:02',
                          sub: "Sorry can't answer your call at the",
                        ),
                        SubTitle(
                          time: '0:02',
                          sub: "moment",
                        ),
                        SubTitle(
                          time: '1:02',
                          sub: "Cause she really",
                        ),
                        SubTitle(
                          time: '2:02',
                          sub: "Got me focused",
                        ),
                        SubTitle(
                          time: '3:02',
                          sub: "On her lips wow",
                        ),
                        SubTitle(
                          time: '4:02',
                          sub: "Sorry can't answer your call",
                        ),
                        SubTitle(
                          time: '5:02',
                          sub: "Sorry can't answer your call",
                        ),
                        SubTitle(
                          time: '6:02',
                          sub: "Sorry can't answer your call",
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }
}

class SubTitle extends StatelessWidget {
  const SubTitle({
    Key key,
    this.time,
    this.sub,
  }) : super(key: key);
  final String time, sub;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListTile(
        onTap: () {},
        leading: Text(
          time,
          style: GoogleFonts.getFont(
            'Montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        title: Text(
          sub,
          style: GoogleFonts.getFont(
            'Montserrat',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButton(
        dropdownColor: primaryBGColor,
        underline: SizedBox(),
        value: 1,
        items: [
          DropdownMenuItem(
            child: Text(
              'English',
              style: GoogleFonts.getFont(
                'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text(
              'Tiếng việt',
              style: GoogleFonts.getFont(
                'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            value: 2,
          ),
        ],
        onChanged: (value) {},
      ),
    );
  }
}

class ControllerButton extends StatelessWidget {
  const ControllerButton({
    Key key,
    this.icon,
    this.onControllerPress,
  }) : super(key: key);
  final IconData icon;
  final Function onControllerPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: onControllerPress,
        child: Container(
          width: 25,
          height: double.infinity,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ReactButton extends StatelessWidget {
  const ReactButton({
    Key key,
    this.count,
    this.icon,
  }) : super(key: key);
  final int count;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, right: 14),
      child: Row(
        children: [
          Icon(
            icon,
            color: primaryColor,
          ),
          SizedBox(
            width: 6.45,
          ),
          Text(
            '$count' ?? '0',
            style: GoogleFonts.getFont(
              'Montserrat',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
