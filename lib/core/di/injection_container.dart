import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:route_task/core/di/injection_container.config.dart';
import 'package:route_task/features/home/domain/usecases/get_all_products_use_case.dart';
import 'package:route_task/features/home/presentation/cubit/home_cubit.dart';

final getIt = GetIt.instance;  
  
@InjectableInit(  
  initializerName: 'init', 
  preferRelativeImports: true,
  asExtension: true, 
)  
void configureDependencies() => getIt.init();  

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio {
    final Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,),);
    return dio;
  }

  @lazySingleton
  HomeCubit get homeCubit => HomeCubit(
        getAllProductsUseCase: getIt<GetAllProductsUseCase>(),
      );
}
