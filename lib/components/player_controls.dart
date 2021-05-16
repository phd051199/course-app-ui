import 'dart:ui';

import 'package:course_app/components/player_toggle.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({Key key, this.iconSize = 20, this.fontSize = 12})
      : super(key: key);
  final double iconSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        FlickShowControlsAction(
          child: FlickSeekVideoAction(
            child: Center(
              child: FlickVideoBuffer(
                child: FlickAutoHideChild(
                  showIfVideoNotInitialized: false,
                  child: LandscapePlayToggle(),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: FlickAutoHideChild(
            child: Column(
              children: [
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    height: 28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white12,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        FlickPlayToggle(
                          size: 16,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        FlickCurrentPosition(
                          fontSize: fontSize,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            child: FlickVideoProgressBar(
                              flickProgressBarSettings:
                                  FlickProgressBarSettings(
                                height: 10,
                                handleRadius: 0,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 8,
                                ),
                                backgroundColor: Colors.white24,
                                bufferedColor: Colors.white38,
                                getPlayedPaint: (
                                    {double handleRadius,
                                    double height,
                                    double playedPart,
                                    double width}) {
                                  return Paint()
                                    ..shader = LinearGradient(colors: [
                                      Color.fromRGBO(255, 172, 113, 1),
                                      Color.fromRGBO(255, 132, 80, 1),
                                    ], stops: [
                                      0.0,
                                      0.5
                                    ]).createShader(
                                      Rect.fromPoints(
                                        Offset(0, 0),
                                        Offset(width, 0),
                                      ),
                                    );
                                },
                                getHandlePaint: (
                                    {double handleRadius,
                                    double height,
                                    double playedPart,
                                    double width}) {
                                  return Paint()
                                    ..shader = RadialGradient(
                                      colors: [
                                        Color.fromRGBO(255, 172, 113, 1),
                                        Color.fromRGBO(255, 132, 80, 1),
                                        Color.fromRGBO(255, 132, 80, 1),
                                      ],
                                      stops: [0.0, 0.4, 0.5],
                                      radius: 0.4,
                                    ).createShader(
                                      Rect.fromCircle(
                                        center: Offset(playedPart, height / 2),
                                        radius: handleRadius,
                                      ),
                                    );
                                },
                              ),
                            ),
                          ),
                        ),
                        FlickTotalDuration(
                          fontSize: fontSize,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FlickSoundToggle(
                          size: 16,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.hd,
                          size: 16,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FlickFullScreenToggle(
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
