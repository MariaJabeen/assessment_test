import 'package:assesment_test/services/third_party_services/video_player_helper.dart';
import 'package:assesment_test/src/features/Movies/controller/movie_detail_controller.dart';
import 'package:assesment_test/src/features/Movies/usecase/get_movie_detail.dart';
import 'package:assesment_test/src/features/Movies/usecase/get_video_key.dart';
import 'package:assesment_test/utils/globals.dart';
import 'package:assesment_test/utils/router/route_handler.dart';
import 'package:get/get.dart';

class MoviesDetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieDetailController(
          navigation: sl<Navigation>(),
          getMovieDetail: sl<GetMovieDetail>(),
          videoPlayerHelper: sl<VideoPlayerHelper>(),
          getVideoKey: sl<GetVideoKey>(),
        ));
  }
}
