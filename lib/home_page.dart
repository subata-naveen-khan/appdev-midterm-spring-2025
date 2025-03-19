import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midterm_s2025/Product/product_card.dart';
import 'package:midterm_s2025/Product/product_model.dart';
import 'package:midterm_s2025/bloc/product_bloc.dart';
import 'package:midterm_s2025/bloc/states.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProductsLoaded) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 300,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final ProductModel product = state.products[index];
                return ProductCard(product: product);
              },
            ),
          );
        } else if (state is ProductError) {
          return const Center(
            child: Text('Failed to load products'),
          );
        } else {
          return Container();
        }
      },
    );
  }


}