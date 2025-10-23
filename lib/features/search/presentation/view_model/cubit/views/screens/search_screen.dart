import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamel_fibo/features/Home/presentation/widgets/custom_productItem.dart';
import 'package:shamel_fibo/features/search/presentation/view_model/cubit/search_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
          TextField(
            decoration: InputDecoration(hintText: "search"),
            onChanged: (query) {
              context.read<SearchCubit>().searchProduct(query);
            },
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is SearchError) {
                  return Center(child: Text(state.error));
                }
                if (state is SearchSuccess) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return CustomProductitem(
                        productModel: state.products[index],
                      );
                    },
                  );
                }
                return Text("search!");
              },
            ),
          ),
        ],
      ),
    );
  }
}
