import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shamel_fibo/core/routing/router_generation.dart';
import 'package:shamel_fibo/features/Home/data/models/product_model.dart';

class CustomProductitem extends StatelessWidget {
  final ProductModel productModel;
  const CustomProductitem({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(
          context,
        ).push(RouterGeneration.details, extra: productModel);
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9.r),
                child: CachedNetworkImage(
                  imageUrl: "${productModel.thumbnail}",
                ),
              ),
            ),
            Text(
              "${productModel.title}",
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
            ),
            Text(
              "${productModel.price}",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(128, 128, 128, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
