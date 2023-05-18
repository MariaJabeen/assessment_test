import 'package:assesment_test/src/features/Movies/controller/movie_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class WatchTrailerScreen extends StatefulWidget {
  const WatchTrailerScreen({Key? key}) : super(key: key);

  @override
  State<WatchTrailerScreen> createState() => _WatchTrailerScreenState();
}

class _WatchTrailerScreenState extends State<WatchTrailerScreen> {
  late MovieDetailController controller;
  @override
  void initState() {
    super.initState();
    controller = Get.find<MovieDetailController>();
    Future.delayed(const Duration(seconds: 3));
    controller.videoPlayerController.addListener(() {
      setState(() {
        if (controller.videoPlayerController.value.hasError) {
          print("==========${controller.videoPlayerController.value.errorDescription}");
        }
        if (controller.videoPlayerController.value.isInitialized) {
          controller.videoPlayerHelper.playVideo();

        }

          });
    });

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: controller.videoPlayerController.value.isInitialized
            ? AspectRatio(
                aspectRatio: controller.videoPlayerController.value.aspectRatio,
                child: VideoPlayer(controller.videoPlayerController))
            : const SizedBox());
  }

  @override
  void dispose() {
    controller.videoPlayerHelper.destroyVideoPlayer();
    super.dispose();
  }
}
