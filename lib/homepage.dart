import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midterm_s2025/Product/product_model.dart';
import 'package:midterm_s2025/bloc/events.dart';
import 'package:midterm_s2025/bloc/product_bloc.dart';
import 'package:midterm_s2025/bloc/states.dart';
import 'package:midterm_s2025/Product/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<ProductBloc>().add(LoadProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'E-Shop', 
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.dark_mode, 
                color: Colors.black,
                size: 20,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart, 
                color: Colors.black,
                size: 20,
              ),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 228, 219, 234),
      ),
      // appBar: AppBar(
      //   title: const Text('E-Shop'),
      //   backgroundColor: Color.fromARGB(255, 228, 219, 234),
      // ),
      // body: Card(
      //   color: Colors.red[100],
      //   child: ListView.builder(
      //     itemCount: 4,
      //     itemBuilder: (context, index) {
      //     final obj = ObjModel(
      //       name: 'Object $index',
      //       obj: 'description for object $index',
      //     );
      //     return ObjCard(obj: obj);
      //     },
      //   ),
      // ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductsLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final ProductModel product = state.products[index];
                return ProductCard(product: product);
              },
            );
          } else if (state is ProductError) {
            return Center(
              child: Text('Failed to load product'),
            );
          } else {
            return Container();
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        backgroundColor: Color.fromARGB(255, 228, 219, 234),
      ),
    );
  }
}