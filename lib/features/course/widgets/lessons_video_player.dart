import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

final FlickManager flickManager = FlickManager(
  videoPlayerController: VideoPlayerController.networkUrl(
    Uri.parse(
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4,'),
  ),
);

class LessonsVideoPlayer extends StatefulWidget {
  const LessonsVideoPlayer({super.key});

  @override
  State<LessonsVideoPlayer> createState() => LessonsVideoPlayerState();
}

class LessonsVideoPlayerState extends State<LessonsVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: FlickVideoPlayer(flickManager: flickManager),
      ),
    );
  }
}
