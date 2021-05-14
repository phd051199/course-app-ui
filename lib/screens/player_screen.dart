import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

import '../components/home_appbar.dart';
import '../utils/constants.dart';

class PlayerScreen extends StatefulWidget {
  PlayerScreen({Key key, this.videoLink}) : super(key: key);
  final String videoLink;

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  VideoPlayerController controller;
  int playbackTime = 0;

  void initPlayer() {
    controller = VideoPlayerController.network(widget.videoLink)
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
    controller.addListener(() {
      setState(() {
        playbackTime = controller.value.position.inSeconds;
      });
    });
    controller.value.isPlaying ? Wakelock.disable() : Wakelock.enable();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: !isLandScape
          ? HomeAppBar(
              onPressed: () => Get.back(),
            )
          : null,
      body: Stack(
        children: [
          Container(
            color: primaryBGColor,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                  child: Container(
                    child: Text(
                      'Course – Simple Flutter App',
                      style: GoogleFonts.getFont(
                        'Montserrat',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Container(
                    height: size.width * 0.54,
                    child: Stack(
                      children: [
                        controller.value.isInitialized
                            ? AspectRatio(
                                aspectRatio: controller.value.aspectRatio,
                                child: VideoPlayer(controller),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                        Align(
                          alignment: Alignment(0, 0.9),
                          child: Container(
                            height: 30,
                            width: size.width * 0.92,
                            decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ControllerButton(
                                    onControllerPress: () {
                                      setState(
                                        () {
                                          controller.value.isPlaying
                                              ? controller.pause()
                                              : controller.play();
                                        },
                                      );
                                    },
                                    icon: controller.value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow),
                                Container(
                                  width: size.width * 0.58,
                                  child: SliderTheme(
                                    data: SliderThemeData(
                                      thumbShape: RoundSliderThumbShape(
                                        elevation: 0,
                                      ),
                                      trackHeight: 18,
                                      thumbColor: secondaryColor,
                                      activeTrackColor: secondaryColor,
                                      inactiveTrackColor: Colors.white30,
                                    ),
                                    child: Slider(
                                      min: 0,
                                      max: controller.value.duration.inSeconds
                                          .toDouble(),
                                      value: playbackTime.toDouble(),
                                      onChanged: (v) {
                                        controller.seekTo(
                                          Duration(
                                            seconds: v.toInt(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    ControllerButton(
                                      icon: Icons.volume_up,
                                    ),
                                    ControllerButton(
                                      icon: Icons.hd,
                                    ),
                                    ControllerButton(
                                      icon: Icons.fullscreen,
                                    ),
                                  ],
                                ),
                              ],
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
    super.dispose();
    controller.dispose();
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
            fontWeight: FontWeight.w300,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        title: Text(
          sub,
          style: GoogleFonts.getFont(
            'Montserrat',
            fontWeight: FontWeight.w300,
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
