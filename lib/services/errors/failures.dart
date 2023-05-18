import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);
}

Failure handleFailure(Either<Failure, dynamic> resultEither) {
  return resultEither.fold((failure) => failure, (r) => null)!;
}

class NetworkFailure extends Failure {
  const NetworkFailure(message) : super(message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(message) : super(message);

  @override
  List<Object> get props => [message];
}

class DioDefaultFailure extends Failure {
  const DioDefaultFailure({required String message}) : super(message);

  @override
  List<Object?> get props => [message];
}
