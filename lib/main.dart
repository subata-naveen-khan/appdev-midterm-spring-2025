import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midterm_s2025/bloc/product_bloc.dart';
import 'package:midterm_s2025/homepage.dart';
import 'package:midterm_s2025/Product/prod_repo.dart';

void main() {
  final ProductRepo prodRepo = ProductRepo();
  final ProductBloc productBloc = ProductBloc(prodRepo: prodRepo);
  
  runApp(
  MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => productBloc),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Midterm S2025',
      home: HomePage(),
    );
  }
}
