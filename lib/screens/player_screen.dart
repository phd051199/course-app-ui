import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../components/home_appbar.dart';
import '../utils/constants.dart';

class PlayerScreen extends StatefulWidget {
  PlayerScreen({Key key, this.videoLink}) : super(key: key);
  final String videoLink;

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  VideoPlayerController _controller;
  int playbackTime = 0;

  void initPlayer() {
    _controller = VideoPlayerController.network(widget.videoLink)
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
    _controller.addListener(() {
      setState(() {
        playbackTime = _controller.value.position.inSeconds;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        onPressed: () => Get.back(),
      ),
      body: Stack(
        children: [
          Container(
            color: primaryBGColor,
          ),
          Column(
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
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Container(
                  height: 220,
                  child: Stack(
                    children: [
                      _controller.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
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
                          height: 35,
                          width: 220 / 0.6,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              ControllerButton(
                                  onControllerPress: () {
                                    setState(
                                      () {
                                        _controller.value.isPlaying
                                            ? _controller.pause()
                                            : _controller.play();
                                      },
                                    );
                                  },
                                  icon: _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow),
                              Expanded(
                                flex: 9,
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
                                    max: _controller.value.duration.inSeconds
                                        .toDouble(),
                                    value: playbackTime.toDouble(),
                                    onChanged: (v) {
                                      _controller.seekTo(
                                        Duration(
                                          seconds: v.toInt(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Row(
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
                              )
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
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
