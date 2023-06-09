import 'package:assesment_test/services/errors/failures.dart';
import 'package:assesment_test/src/features/Movies/usecase/get_movie_detail.dart';
import 'package:assesment_test/src/features/Movies/usecase/get_movies_list.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  /// This method will get movies list
  /// Output: [MovieResponse] contains [List][Movie] and total movies.
  /// if unsuccessful the response will be [Failure]
  Future<Either<Failure, MovieResponse>> getMoviesList();

  /// This method will get movies detail
  /// Input : [int] the id of the selected movie
  /// Output: [MovieDetailResponse] contains all the detail information of specific movie.
  /// if unsuccessful the response will be [Failure]
  Future<Either<Failure, MovieDetailResponse>> getMovieDetail(int id);

  /// This method will get the key of movie trailer
  /// Input : [int] the id of the selected movie
  /// Output: [String] contains the key of movie trailer.
  /// if unsuccessful the response will be [Failure]
  Future<Either<Failure, String>> getVideoKey(int id);
}
