import 'package:assesment_test/services/data_sources/remote_data_source/dio_wrapper.dart';
import 'package:assesment_test/services/data_sources/remote_data_source/remote_data_source.dart';
import 'package:assesment_test/services/data_sources/remote_data_source/remote_datasource_imp.dart';
import 'package:assesment_test/services/repository/repository.dart';
import 'package:assesment_test/services/repository/repository_imp.dart';
import 'package:assesment_test/services/third_party_services/video_player_helper.dart';
import 'package:assesment_test/utils/globals.dart';
import 'package:assesment_test/utils/network/network_info.dart';
import 'package:assesment_test/utils/network/network_info_imp.dart';
import 'package:assesment_test/utils/router/route_handler.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:video_player/video_player.dart';

class DependencyInjection {
  static Future<void> init() async {
    permanentPut<Dio>(Dio(BaseOptions(
        receiveTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        baseUrl: baseUrl)));
    permanentPut<Navigation>(NavigationImpl());
    permanentPut<InternetConnectionChecker>(InternetConnectionChecker());
    permanentPut<NetworkInfo>(
        NetworkInfoImp(connectionChecker: sl<InternetConnectionChecker>()));
    permanentPut<Logger>(Logger());

    permanentPut<RemoteDatasource>(
      RemoteDataSourceImpl(
        logger: sl<Logger>(),
        dioWrapper: DioWrapperImpl(
          logger: sl<Logger>(),
          dio: sl<Dio>(),
        ),
      ),
    );

    permanentPut<Repository>(
      RepositoryImpl(
        remoteDatasource: sl<RemoteDatasource>(),
        networkInfo: sl<NetworkInfo>(),
      ),
    );
    permanentPut<VideoPlayerController>(VideoPlayerController.network(''));

    permanentPut<VideoPlayerHelper>(
      VideoPlayerHelperImp(sl()),
    );
  }
}
