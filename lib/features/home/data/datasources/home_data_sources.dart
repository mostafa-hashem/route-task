import 'package:dartz/dartz.dart';

import 'package:route_task/core/error/failures.dart';
import 'package:route_task/features/home/data/models/product_model.dart';

abstract class HomeDataSources {
  Future<Either<Failures, List<ProductModel>>> getAllProducts();
}
