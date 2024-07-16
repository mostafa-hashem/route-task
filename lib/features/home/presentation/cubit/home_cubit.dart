import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:route_task/features/home/domain/entities/product_entity.dart';
import 'package:route_task/features/home/domain/usecases/get_all_products_use_case.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  final GetAllProductsUseCase getAllProductsUseCase;

  HomeCubit({
    required this.getAllProductsUseCase,
  }) : super(HomeInitial());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  List<ProductEntity> allProducts = [];

  Future<void> getAllProducts() async {
    emit(HomeGetProductsLoadingState());

    final result = await getAllProductsUseCase.call();
    result.fold((l) {
      
      emit(HomeGetProductsErrorState(message: l.message));
    }, (r) {
      allProducts = r;
      emit(HomeGetProductsSuccessState());
    });
  }
}
