import 'package:assesment_test/services/errors/failures.dart';
import 'package:assesment_test/services/repository/repository.dart';
import 'package:assesment_test/services/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

/// This usecase will get the key of movie trailer
/// Input : [int] the id of the selected movie
/// Output: [String] contains the key of movie trailer.
/// if unsuccessful the response will be [Failure]
class GetVideoKey implements UseCase<String, int> {
  final Repository _repository;

  GetVideoKey(this._repository);

  @override
  Future<Either<Failure, String>> call(int params) {
    return _repository.getVideoKey(params);
  }
}

class VideoResults {
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? publishedAt;
  String? id;

  VideoResults(
      {this.iso6391,
      this.iso31661,
      this.name,
      this.key,
      this.site,
      this.size,
      this.type,
      this.official,
      this.publishedAt,
      this.id});

  VideoResults.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    publishedAt = json['published_at'];
    id = json['id'];
  }
}
