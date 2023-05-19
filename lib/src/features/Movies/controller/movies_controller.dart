import 'package:assesment_test/services/errors/failures.dart';
import 'package:assesment_test/services/usecase/usecase.dart';
import 'package:assesment_test/src/common_widgets/error_snackbar.dart';
import 'package:assesment_test/src/features/Movies/controller/movie_detail_controller.dart';
import 'package:assesment_test/src/features/Movies/usecase/get_movies_list.dart';
import 'package:assesment_test/utils/router/app_routes.dart';
import 'package:assesment_test/utils/router/route_handler.dart';
import 'package:get/get.dart';

enum SearchMovie { enabled, disabled }

class MoviesScreenController extends GetxController {
  Navigation navigation;
  GetMoviesList getMoviesList;
  MovieDetailController movieDetailController;

  MoviesScreenController(
      {required this.navigation,
      required this.getMoviesList,
      required this.movieDetailController});

  Rx<SearchMovie> searchingMovie = Rx<SearchMovie>(SearchMovie.disabled);
  final Rx<bool> isFetchingList = Rx<bool>(false);

  Rx<MovieResponse> movieResponse = Rx<MovieResponse>(MovieResponse.empty());

  RxList<Movie> moviesList = RxList<Movie>([]);

  Future<void> getMoviesListData() async {
    isFetchingList(true);

    var resultEither = await getMoviesList.call(NoParams());

    isFetchingList(false);

    if (resultEither.isLeft()) {
      final failure = handleFailure(resultEither);
      ErrorSnackbar(message: failure.message).showErrorSnackbar();
      return;
    }
    movieResponse.value = resultEither.getOrElse(() => MovieResponse.empty());
    moviesList.value = movieResponse.value.moviesList!;
  }

  void setSelectedMovie(int id) {
    movieDetailController.selectedMovieId(id);
    moveToDetailScreen();
  }

  void moveToDetailScreen() {
    navigation.navigate(Routes.movieDetailScreen);
  }

  void updateSearchingMovie(SearchMovie searchMovie) {
    searchingMovie(searchMovie);
  }

  RxList<Movie> searchResults = RxList<Movie>([]);

  void searchMovie(String searchText) {
    isFetchingList(true);
    searchResults.clear();
    for (Movie item in moviesList) {
      if (item.title!.toLowerCase().contains(searchText.toLowerCase())) {
        searchResults.value.add(item);
      }

    }
    isFetchingList(false);

  }

  bool searchingVisible(searchText) =>
      moviesList.isNotEmpty && searchText.isNotEmpty;

  bool searchingInVisible(searchText) =>
      moviesList.isNotEmpty && searchText.isEmpty;
}
