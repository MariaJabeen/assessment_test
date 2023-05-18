import 'dart:async';
import 'package:video_player/video_player.dart';

/// Abstract Class for providing Video player
abstract class VideoPlayerHelper {
  /// This method will be do the main heavy lifting and it will
  /// initialize the video player and make it ready to use
  Future initializeVideoPlayer({required String url});

  /// This method will be responsible for destroying the video player instances from the memory
  void destroyVideoPlayer();

  /// This method will be responsible for pausing the Video
  Future<void> pauseVideo();

  /// This method will be responsible for playing the Video
  Future<void> playVideo();

  VideoPlayerController getVideoPlayerController();
}

/// [VideoPlayerHelperImp] implementation of [VideoPlayerHelper]
class VideoPlayerHelperImp implements VideoPlayerHelper {
  late VideoPlayerController videoPlayerController;

  VideoPlayerHelperImp(this.videoPlayerController);

  @override
  Future initializeVideoPlayer({required String url}) async {
    videoPlayerController = VideoPlayerController.network(url)
      ..initialize().then((value) => {});
  }

  @override
  void destroyVideoPlayer() {
    videoPlayerController.dispose();
  }

  @override
  Future<void> pauseVideo() async {
    await videoPlayerController.pause();
  }

  @override
  Future<void> playVideo() async {
    await videoPlayerController.play();
  }

  @override
  VideoPlayerController getVideoPlayerController() {
    return videoPlayerController;
  }
}
