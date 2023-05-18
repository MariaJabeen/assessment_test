import 'package:assesment_test/src/features/Movies/usecase/get_movie_detail.dart';
import 'package:assesment_test/src/features/Movies/usecase/get_movies_list.dart';

abstract class RemoteDatasource {
  /// This method will get movies list
  /// Output: [MovieResponse] contains [List][Movie] and total movies.
  /// it may throw exception.
  Future<MovieResponse> getMoviesList();

  /// This method will get movies detail
  /// Input : [int] the id of the selected movie
  /// Output: [MovieDetailResponse] contains all the detail information of specific movie.
  /// it may throw exception.
  Future<MovieDetailResponse> getMovieDetail(int id);

  /// This usecase will get the key of movie trailer
  /// Input : [int] the id of the selected movie
  /// Output: [String] contains the key of movie trailer.
  /// it may throw exception.
  Future<String> getVideoKey(int id);
}
