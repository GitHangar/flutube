import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class VideoPlayerMobile extends StatefulWidget {
  const VideoPlayerMobile({
    super.key,
    required this.defaultQuality,
    required this.resolutions,
  });

  final int defaultQuality;
  final List<VideoQalityUrls> resolutions;

  @override
  State<VideoPlayerMobile> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerMobile>
    with WidgetsBindingObserver {
  late PodPlayerController _controller;

  @override
  void initState() {
    super.initState();

    mediaPlayerControllerSetUp();
  }

  void mediaPlayerControllerSetUp() {
    _controller = PodPlayerController(
      podPlayerConfig: PodPlayerConfig(
        initialVideoQuality: widget.defaultQuality,
      ),
      playVideoFrom: PlayVideoFrom.networkQualityUrls(
        videoPlayerOptions: VideoPlayerOptions(
          allowBackgroundPlayback: true,
        ),
        videoUrls: widget.resolutions,
      ),
    );

    _controller.initialise();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PodVideoPlayer(
      controller: _controller,
    );
  }
}
