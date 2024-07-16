import 'package:dartz/dartz.dart';

import 'package:route_task/core/error/failures.dart';
import 'package:route_task/features/home/domain/entities/product_entity.dart';

abstract class HomeDomainRepo {
  Future<Either<Failures, List<ProductEntity>>> getAllProducts();
}
