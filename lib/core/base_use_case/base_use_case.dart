import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';

abstract class BaseUseCase<T>{

  Future<Either<Failure,T>>call();
}