import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shamel_fibo/core/routing/router_generation.dart';
import 'package:shamel_fibo/core/styling/app_colors.dart';
import 'package:shamel_fibo/core/widgets/primaryButton.dart';
import 'package:shamel_fibo/features/Home/data/models/product_model.dart';
import 'package:shamel_fibo/features/cart/presentation/cubit/cubit/cart_cubit.dart';

class DetailsScreen extends StatelessWidget {
  final ProductModel productModel;

  const DetailsScreen({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(height: 45.h),

            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.go(RouterGeneration.home);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                SizedBox(width: 100.w),
                Text(
                  "Details",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Expanded(
              child: CachedNetworkImage(
                imageUrl: productModel.thumbnail ?? "",
              ),
            ),
            Text(
              productModel.title ?? "No Title",
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
            ),
            Text(
              productModel.description ?? "No Description",
              style: TextStyle(fontSize: 12.sp),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Text("${productModel.price ?? 0}"),
                SizedBox(width: 70, height: 160),
                BlocConsumer<CartCubit, CartState>(
                  listener: (context, state) {
                    if (state is cartAddingSuccess) {
                      final lastProduct =
                          state.cartmodel.products.isNotEmpty
                              ? state.cartmodel.products.last
                              : null;
                      final productTitle = lastProduct?.title ?? 'Product';
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("$productTitle added successfully!"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                    if (state is cartAddingFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is cartAdding) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Primarybutton(
                      onpress: () {
                        final productId = productModel.id;
                        if (productId != null && productId > 0) {
                          context.read<CartCubit>().addtomyCart(
                            productModel.id ?? 0,
                            1,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Invalid id"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      buttonText: "Add to cart",
                      width: 240.w,
                      height: 54.h,
                      color: AppColors.whiteColor,
                      backgroundColor: AppColors.buttonColor,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
