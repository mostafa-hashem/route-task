import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/core/di/injection_container.dart';
import 'package:route_task/features/home/presentation/cubit/home_cubit.dart';
import 'package:route_task/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:route_task/features/home/presentation/widgets/loading_product_item.dart';
import 'package:route_task/features/home/presentation/widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => getIt<HomeCubit>()..getAllProducts(),
          child: BlocBuilder<HomeCubit, HomeStates>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    const CustomAppBar(),
                    if (state is HomeGetProductsSuccessState) _buildGridView(context) else _loadingProductItem(context),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildGridView(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15.h,
          crossAxisSpacing: 15.w,
          childAspectRatio: 9 / 13,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: ProductItem(
              productEntity: HomeCubit.get(context).allProducts[index],
            ),
          );
        },
        itemCount: HomeCubit.get(context).allProducts.length,
      ),
    );
  }
}

Widget _loadingProductItem(BuildContext context) {
  return Expanded(
    child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15.h,
        crossAxisSpacing: 15.w,
        childAspectRatio: 9 / 13,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: const LoadingProductItem(),
        );
      },
      itemCount: 10,
    ),
  );
}
