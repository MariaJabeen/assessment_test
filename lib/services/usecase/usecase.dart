import 'package:assesment_test/services/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class InstantUseCase<Type, Params> {
  Either<Failure, Type> call(Params params);
}

abstract class WatchableUseCase<Type, Params> {
  Stream<Either<Failure, Type>> call(Params params);
}

abstract class RoutesUseCase {
  bool call(String routeName);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
