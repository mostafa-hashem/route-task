import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/core/error/failures.dart';
import 'package:route_task/core/error/server_failures.dart';
import 'package:route_task/features/home/data/datasources/home_data_sources.dart';
import 'package:route_task/features/home/data/models/product_model.dart';
import 'package:route_task/features/home/domain/repositories/home_domain_repo.dart';

@LazySingleton(as: HomeDomainRepo)
class HomeDataRepo implements HomeDomainRepo {
  HomeDataSources homeDataSources;

  HomeDataRepo({required this.homeDataSources});

  @override
  Future<Either<Failures, List<ProductModel>>> getAllProducts() async {
    try {
      return homeDataSources.getAllProducts();
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailures.fromDioException(e));
      }
      return Left(ServerFailures(e.toString()));
    }
  }
}
