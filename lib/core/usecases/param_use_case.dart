import 'package:dartz/dartz.dart';

import 'package:route_task/core/error/failures.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failures, Type>> call(Param param);
}
