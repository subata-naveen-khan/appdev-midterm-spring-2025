import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midterm_s2025/bloc/events.dart';
import 'package:midterm_s2025/bloc/states.dart';
import 'package:midterm_s2025/Product/prod_repo.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo prodRepo;

  ProductBloc({required this.prodRepo}) : super(ProductInitial()) {
    on<LoadProductsEvent>(_onLoadProducts);
  }

  Future<void> _onLoadProducts (
    LoadProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductsLoading());
    try {
      final products = await prodRepo.fetchProducts();
      emit(ProductsLoaded(products: products));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}