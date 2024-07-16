import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:route_task/core/error/failures.dart';
import 'package:route_task/core/usecases/no_param_use_case.dart';

import 'package:route_task/features/home/domain/entities/product_entity.dart';
import 'package:route_task/features/home/domain/repositories/home_domain_repo.dart';

@lazySingleton
class GetAllProductsUseCase implements UseCase<List<ProductEntity>> {
  HomeDomainRepo homeDomainRepo;
  GetAllProductsUseCase({
    required this.homeDomainRepo,
  });
  @override
  Future<Either<Failures, List<ProductEntity>>> call() =>
      homeDomainRepo.getAllProducts();
}
