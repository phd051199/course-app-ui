import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../components/home_appbar.dart';
import '../utils/constants.dart';

class PlayerScreen extends StatefulWidget {
  PlayerScreen({Key key}) : super(key: key);

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4')
      ..initialize().then((_) {
        setState(() {});
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
                child: Stack(
                  children: [
                    Container(
                      height: 240,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: _controller.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            )
                          : Container(),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
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
                  ],
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
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: () {
          setState(
            () {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            },
          );
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
