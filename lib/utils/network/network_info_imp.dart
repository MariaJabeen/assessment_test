import 'package:assesment_test/utils/network/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfoImp implements NetworkInfo {
  final InternetConnectionChecker _connectionChecker;

  NetworkInfoImp({required InternetConnectionChecker connectionChecker}) : _connectionChecker = connectionChecker;

  @override
  Future<bool> get isConnected => _connectionChecker.hasConnection;
}
