import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shamel_fibo/core/routing/router_generation.dart';
import 'package:shamel_fibo/features/Home/data/models/product_model.dart';
import 'package:shamel_fibo/features/Home/presentation/cubit/home_cubit.dart';
import 'package:shamel_fibo/features/Home/presentation/widgets/custom_productItem.dart';
import 'package:shamel_fibo/features/cart/presentation/cubit/cubit/cart_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getproduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 24.sp, right: 24.sp),
        child: Column(
          children: [
            SizedBox(height: 45.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Home",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
                Spacer(flex: 1),
                IconButton(
                  onPressed: () {
                    context.read<CartCubit>().getCart();
                    context.push(RouterGeneration.cart);
                  },
                  icon: Icon(Icons.add_shopping_cart),
                ),
              ],
            ),

            SizedBox(height: 10.h),
            InkWell(
              onTap: () {
                context.push(RouterGeneration.search);
              },
              child: Container(
                width: double.infinity,
                height: 52.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromARGB(255, 197, 196, 196),
                    width: 1.w,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Color.fromRGBO(179, 179, 179, 1)),
                    Text(
                      "Search for products...",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: Color.fromRGBO(153, 153, 153, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is HomeError) {
                  return Center(child: Text(state.error));
                }
                if (state is HomeSuccess) {
                  List<ProductModel> products = state.response.products;
                  if (products.isEmpty) {
                    return Text("no items found");
                  }
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context.read<HomeCubit>().getproduct();
                      },
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              2,
                        ),
                        itemBuilder: (context, index) {
                          return CustomProductitem(
                            productModel: products[index],
                          ); 
                        },
                        itemCount: products.length,
                      ),
                    ),
                  );
                }
                return Text("there is an error");
              },
            ),
          ],
        ),
      ),
    );
  }
}
