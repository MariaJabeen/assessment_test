import 'package:assesment_test/services/errors/failures.dart';
import 'package:assesment_test/services/repository/repository.dart';
import 'package:assesment_test/services/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

/// This usecase will get movies detail
/// Input : [int] the id of the selected movie
/// Output: [MovieDetailResponse] contains all the detail information of specific movie.
/// if unsuccessful the response will be [Failure]
class GetMovieDetail implements UseCase<MovieDetailResponse, int> {
  final Repository _repository;

  GetMovieDetail(this._repository);

  @override
  Future<Either<Failure, MovieDetailResponse>> call(int params) {
    return _repository.getMovieDetail(params);
  }
}

class MovieDetailResponse extends Equatable {
  String? backdropPath;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? status;
  String? tagline;
  String? title;
  bool? video;

  MovieDetailResponse({
    this.backdropPath,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.status,
    this.tagline,
    this.title,
    this.video,
  });

  MovieDetailResponse.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    if (json['genres'] != null) {
      genres = List.from(json['genres'])
          .map((data) => Genres.fromJson(data))
          .toList();
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
  }

  @override
  List<Object?> get props => [
        backdropPath,
        genres,
        homepage,
        id,
        imdbId,
        originalLanguage,
        originalTitle,
        overview,
        posterPath,
        releaseDate,
        status,
        tagline,
        title,
        video
      ];

  factory MovieDetailResponse.empty() => MovieDetailResponse(
        backdropPath: '',
        genres: const [],
        homepage: '',
        id: 0,
        imdbId: '',
        originalLanguage: '',
        originalTitle: '',
        overview: '',
        posterPath: '',
        releaseDate: '',
        status: '',
        tagline: '',
        title: '',
        video: false,
      );
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
