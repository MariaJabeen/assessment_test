import 'package:assesment_test/services/data_sources/remote_data_source/remote_data_source.dart';
import 'package:assesment_test/services/errors/failures.dart';
import 'package:assesment_test/services/repository/repository.dart';
import 'package:assesment_test/src/features/Movies/usecase/get_movie_detail.dart';
import 'package:assesment_test/src/features/Movies/usecase/get_movies_list.dart';
import 'package:assesment_test/utils/constants/string_constants.dart';
import 'package:assesment_test/utils/network/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RepositoryImpl extends Repository {
  final RemoteDatasource _remoteDatasource;
  final NetworkInfo _networkInfo;

  RepositoryImpl({
    required RemoteDatasource remoteDatasource,
    required NetworkInfo networkInfo,
  })  : _remoteDatasource = remoteDatasource,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, MovieResponse>> getMoviesList() async {
    if (!await _networkInfo.isConnected) {
      return Left(NetworkFailure(AppStrings.noInternet));
    }
    try {
      return Right(await _remoteDatasource.getMoviesList());
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (_) {
      return Left(ServerFailure(AppStrings.somethingWentWrong));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetailResponse>> getMovieDetail(int id) async {
    if (!await _networkInfo.isConnected) {
      return Left(NetworkFailure(AppStrings.noInternet));
    }
    try {
      return Right(await _remoteDatasource.getMovieDetail(id));
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (_) {
      return Left(ServerFailure(AppStrings.somethingWentWrong));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getVideoKey(int id) async {
    if (!await _networkInfo.isConnected) {
      return Left(NetworkFailure(AppStrings.noInternet));
    }
    try {
      return Right(await _remoteDatasource.getVideoKey(id));
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (_) {
      return Left(ServerFailure(AppStrings.somethingWentWrong));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
