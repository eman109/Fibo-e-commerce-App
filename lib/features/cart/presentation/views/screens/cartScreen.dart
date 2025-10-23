import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamel_fibo/core/service_locator/service_locator.dart';
import 'package:shamel_fibo/core/widgets/primaryButton.dart';
import 'package:shamel_fibo/features/cart/presentation/cubit/cubit/cart_cubit.dart';
import 'package:shamel_fibo/features/payments/data/repo/pay_repo.dart';
import 'package:shamel_fibo/features/payments/data/repo/payment_stripe.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back))],
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is CartError) {
            return Center(child: Text(state.message));
          }
          if (state is CartSuccess) {
            return Column(
              children: [
                Text("my cart"),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.cartmodel.products.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(
                          "${state.cartmodel.products[index].title}",
                        ),
                        subtitle: Text(
                          "${state.cartmodel.products[index].price}",
                        ),
                      );
                    },
                  ),
                ),
                Text("Total price ${state.cartmodel.total}"),
                Text("discounted price ${state.cartmodel.discountTotal}"),
                Primarybutton(
                  onpress: () async{
                    await getit<PayRepo>().makePayment(
                      state.cartmodel.total.toInt(),
                      "usd",
                    );
                  },
                  buttonText: "Buy Now!",
                ),
              ],
            );
          }
          return Text("no data found");
        },
      ),
    );
  }
}

