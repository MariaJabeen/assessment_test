import 'package:assesment_test/services/errors/failures.dart';
import 'package:assesment_test/services/third_party_services/video_player_helper.dart';
import 'package:assesment_test/src/common_widgets/error_snackbar.dart';
import 'package:assesment_test/src/features/Movies/usecase/get_movie_detail.dart';
import 'package:assesment_test/src/features/Movies/usecase/get_video_key.dart';
import 'package:assesment_test/utils/constants/color_constants.dart';
import 'package:assesment_test/utils/globals.dart';
import 'package:assesment_test/utils/router/app_routes.dart';
import 'package:assesment_test/utils/router/route_handler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class MovieDetailController extends GetxController {
  Navigation navigation;
  GetMovieDetail getMovieDetail;
  VideoPlayerHelper videoPlayerHelper;
  GetVideoKey getVideoKey;
  MovieDetailController(
      {required this.navigation,
      required this.getMovieDetail,
      required this.videoPlayerHelper,
      required this.getVideoKey});

  RxInt selectedMovieId = RxInt(0);

  Rx<MovieDetailResponse> movieDetailResponse =
      Rx<MovieDetailResponse>(MovieDetailResponse.empty());

  final Rx<bool> isDetailFetching = Rx<bool>(false);

  List<Color> colorList = [
    ColorConstants.greenColor,
    ColorConstants.pinkColor,
    ColorConstants.purpleColor,
    ColorConstants.yellowColor,
    ColorConstants.greenColor,
    ColorConstants.pinkColor,
    ColorConstants.purpleColor,
    ColorConstants.yellowColor,
  ];

  void setSelectedMovie(int id) {
    selectedMovieId(id);
  }

  Future<void> getMoviesDetailData() async {
    isDetailFetching(true);

    var resultEither = await getMovieDetail.call(selectedMovieId.value);
    isDetailFetching(false);

    if (resultEither.isLeft()) {
      final failure = handleFailure(resultEither);
      ErrorSnackbar(message: failure.message).showErrorSnackbar();
      return;
    }
    movieDetailResponse.value =
        resultEither.getOrElse(() => MovieDetailResponse.empty());
  }

  Future<void> watchMovieTrailer() async {
    var resultEither = await getVideoKey.call(selectedMovieId.value);

    if (resultEither.isLeft()) {
      final failure = handleFailure(resultEither);
      ErrorSnackbar(message: failure.message).showErrorSnackbar();
      return;
    }
    await videoPlayerHelper.initializeVideoPlayer(
        url: '$youtubeAddress${resultEither.getOrElse(() => '')}');
    videoPlayerController = videoPlayerHelper.getVideoPlayerController();
    Future.delayed(const Duration(seconds: 3));

    navigation.navigate(Routes.watchTrailerScreen);
  }

  late VideoPlayerController videoPlayerController;
}
