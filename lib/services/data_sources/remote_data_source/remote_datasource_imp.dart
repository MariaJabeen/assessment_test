import 'package:assesment_test/app/api_paths/api_paths.dart';
import 'package:assesment_test/services/data_sources/remote_data_source/dio_wrapper.dart';
import 'package:assesment_test/services/data_sources/remote_data_source/remote_data_source.dart';
import 'package:assesment_test/src/features/Movies/usecase/get_movie_detail.dart';
import 'package:assesment_test/src/features/Movies/usecase/get_movies_list.dart';
import 'package:assesment_test/src/features/Movies/usecase/get_video_key.dart';
import 'package:assesment_test/utils/constants/string_constants.dart';
import 'package:assesment_test/utils/globals.dart';
import 'package:logger/logger.dart';

class RemoteDataSourceImpl extends RemoteDatasource {
  final DioWrapper _dio;
  final Logger _logger;

  RemoteDataSourceImpl({
    required DioWrapper dioWrapper,
    required Logger logger,
  })  : _logger = logger,
        _dio = dioWrapper;

  @override
  Future<MovieResponse> getMoviesList() async {
    final response = await _dio.onGet(
      api: "$baseUrl${ApiPath.upcomingMovies}",
    );

    _logger.i("[ Remote DataSource | getMoviesList] $response");

    if (response.data != null) {
      return MovieResponse.fromJson(response.data);
    }

    throw AppStrings.somethingWentWrong;
  }

  @override
  Future<MovieDetailResponse> getMovieDetail(int id) async {
    final response = await _dio.onGet(
      api: "$baseUrl$id",
    );

    _logger.i("[ Remote DataSource | getMoviesDetail] $response");

    if (response.data != null) {
      return MovieDetailResponse.fromJson(response.data);
    }

    throw AppStrings.somethingWentWrong;
  }

  @override
  Future<String> getVideoKey(int id) async {
    final response = await _dio.onGet(
      api: "$baseUrl$id/videos",
    );

    _logger.i("[ Remote DataSource | getMoviesKey] $response");

    if (response.data != null) {
      var key = List.from(response.data['results'])
          .map((data) => VideoResults.fromJson(data))
          .toList()
          .where((element) => element.type == 'Teaser')
          .first
          .key;
      return key ?? '';
    }

    throw AppStrings.somethingWentWrong;
  }
}
