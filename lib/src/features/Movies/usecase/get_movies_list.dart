import 'package:assesment_test/services/errors/failures.dart';
import 'package:assesment_test/services/repository/repository.dart';
import 'package:assesment_test/services/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

/// This usecase will get movies list
/// Input : [NoParams] contains no parameter
/// Output: [MovieResponse] contains [List][Movie] and total movies.
/// if unsuccessful the response will be [Failure]
class GetMoviesList implements UseCase<MovieResponse, NoParams> {
  final Repository _repository;

  GetMoviesList(this._repository);

  @override
  Future<Either<Failure, MovieResponse>> call(NoParams params) {
    return _repository.getMoviesList();
  }
}

class MovieResponse extends Equatable {
  List<Movie>? moviesList;
  int? totalPages;
  int? totalResults;

  MovieResponse({this.moviesList, this.totalPages, this.totalResults});

  MovieResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      moviesList = List.from(json['results'])
          .map((data) => Movie.fromJson(data))
          .toList();
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  factory MovieResponse.empty() =>
      MovieResponse(moviesList: const [], totalPages: 0, totalResults: 0);

  @override
  List<Object?> get props => [moviesList, totalPages, totalResults];
}

class Movie extends Equatable {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;

  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'] as int;
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'] as double;
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
  }

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
      ];
}
