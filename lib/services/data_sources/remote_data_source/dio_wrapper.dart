import 'package:assesment_test/services/errors/failures.dart';
import 'package:assesment_test/utils/constants/string_constants.dart';
import 'package:assesment_test/utils/globals.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

abstract class DioWrapper {
  Future<Response<dynamic>> onPost(
      {required String api,
      required dynamic data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      String? jwt});
  Future<Response<dynamic>> onGet(
      {required String api,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      String? jwt});
}

class DioWrapperImpl extends DioWrapper {
  final Dio _dio;
  final Logger _logger;

  DioWrapperImpl({
    required Dio dio,
    required Logger logger,
  })  : _dio = dio,
        _logger = logger;

  @override
  Future<Response<dynamic>> onPost({
    required String api,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? jwt,
  }) async {
    try {
      _dio.options.queryParameters.addAll({AppStrings.apiKey: apiKey});
      return await _dio.post(api, data: data);
    } on DioError catch (e) {
      _logger.wtf('[ON POST | DIO ERROR] [API | $api] ${e.response}');
      throw DioDefaultFailure(message: AppStrings.somethingWentWrong);
    } catch (e) {
      _logger.wtf('[ON POST | SOMETHING GOES WRONG IN API CALL] $e');
      throw DioDefaultFailure(message: AppStrings.somethingWentWrong);
    }
  }

  @override
  Future<Response<dynamic>> onGet({
    required String api,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? jwt,
  }) async {
    try {
      _dio.options.queryParameters.addAll({AppStrings.apiKey: apiKey});
      return await _dio.get(api);
    } on DioError catch (e) {
      _logger.wtf('[ON GET | DIO ERROR] [API | $api] $e');
      throw DioDefaultFailure(message: AppStrings.somethingWentWrong);
    } catch (e) {
      _logger.wtf('[ON GET | SOMETHING GOES WRONG IN API CALL] $e');
      throw DioDefaultFailure(message: AppStrings.somethingWentWrong);
    }
  }
}
