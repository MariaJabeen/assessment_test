import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);
}

Failure handleFailure(Either<Failure, dynamic> resultEither) {
  return resultEither.fold((failure) => failure, (r) => null)!;
}
