import 'package:assesment_test/services/repository/repository.dart';
import 'package:assesment_test/services/third_party_services/video_player_helper.dart';
import 'package:assesment_test/src/features/Movies/controller/movie_detail_controller.dart';
import 'package:assesment_test/src/features/Movies/controller/movies_controller.dart';
import 'package:assesment_test/src/features/Movies/usecase/get_movie_detail.dart';
import 'package:assesment_test/src/features/Movies/usecase/get_movies_list.dart';
import 'package:assesment_test/src/features/Movies/usecase/get_video_key.dart';
import 'package:assesment_test/utils/globals.dart';
import 'package:assesment_test/utils/router/route_handler.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    registerUseCases();
    registerController();
  }

  void registerUseCases() {
    permanentPut<GetMoviesList>(GetMoviesList(sl<Repository>()));
    permanentPut<GetMovieDetail>(GetMovieDetail(sl<Repository>()));
    permanentPut<GetVideoKey>(GetVideoKey(sl<Repository>()));
  }

  void registerController() {
    permanentPut<MovieDetailController>(MovieDetailController(
      navigation: sl<Navigation>(),
      getMovieDetail: sl<GetMovieDetail>(),
      videoPlayerHelper: sl<VideoPlayerHelper>(),
      getVideoKey: sl<GetVideoKey>(),
    ));
    permanentPut<MoviesScreenController>(MoviesScreenController(
      navigation: sl<Navigation>(),
      getMoviesList: sl<GetMoviesList>(),
      movieDetailController: sl<MovieDetailController>(),
    ));
  }
}
