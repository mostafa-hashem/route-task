import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/core/api/api_service.dart';
import 'package:route_task/core/api/end_points.dart';
import 'package:route_task/core/error/failures.dart';
import 'package:route_task/core/error/server_failures.dart';
import 'package:route_task/features/home/data/datasources/home_data_sources.dart';
import 'package:route_task/features/home/data/models/product_model.dart';

@LazySingleton(as: HomeDataSources)
class HomeRemoteDataSource implements HomeDataSources {
  final ApiService apiService;

  HomeRemoteDataSource({
    required this.apiService,
  });

  @override
  Future<Either<Failures, List<ProductModel>>> getAllProducts() async {
    try {
      final data = await apiService.get(endPoint: EndPoints.products);
      final List<ProductModel> productList = parseProductData(data);
      return Right(productList);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  List<ProductModel> parseProductData(Map<String, dynamic> data) {
    final List<ProductModel> productsList = [];
    for (final product in data['products']) {
      productsList.add(ProductModel.fromJson(product as Map<String, dynamic>));
    }
    return productsList;
  }
}
