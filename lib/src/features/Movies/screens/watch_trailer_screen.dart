import 'package:assesment_test/src/features/Movies/controller/movie_detail_controller.dart';
import 'package:assesment_test/utils/router/route_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchTrailerScreen extends StatefulWidget {
  const WatchTrailerScreen({Key? key}) : super(key: key);

  @override
  State<WatchTrailerScreen> createState() => _WatchTrailerScreenState();
}

class _WatchTrailerScreenState extends State<WatchTrailerScreen> {
  late MovieDetailController controller;
  late YoutubePlayerController youtubePlayerController;
  late Navigation navigation;
  @override
  void initState() {
    super.initState();
    controller = Get.find<MovieDetailController>();
    navigation = Get.find<Navigation>();
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: controller.trailerKey,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
  }

  void listener() {
    if (mounted && !youtubePlayerController.value.isFullScreen) {
      setState(() {});
    }
    if(mounted && youtubePlayerController.value.playerState==PlayerState.ended){
      navigation.goBack();
      youtubePlayerController.reset();

    }
  }

  @override
  void dispose() {
    youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: YoutubePlayer(
          controller: youtubePlayerController,
          showVideoProgressIndicator: true,
          onReady: () {
            youtubePlayerController.addListener(listener);
          },
        ));
  }
}
