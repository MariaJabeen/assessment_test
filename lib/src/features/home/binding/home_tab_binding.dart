import 'package:assesment_test/src/features/Movies/controller/movie_detail_controller.dart';
import 'package:assesment_test/src/features/Movies/controller/movies_controller.dart';
import 'package:assesment_test/src/features/Movies/usecase/get_movies_list.dart';
import 'package:assesment_test/utils/globals.dart';
import 'package:assesment_test/utils/router/route_handler.dart';
import 'package:get/get.dart';

class HomeTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoviesScreenController(
          navigation: sl<Navigation>(),
          getMoviesList: sl<GetMoviesList>(),
          movieDetailController: sl<MovieDetailController>(),
        ));
  }
}
