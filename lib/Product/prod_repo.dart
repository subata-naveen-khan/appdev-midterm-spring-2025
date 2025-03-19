import 'package:midterm_s2025/Product/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductRepo {
  final String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final List decodedJson = jsonDecode(response.body);
        return decodedJson
            .map<ProductModel>((json) => ProductModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load product');
      }
    } catch (e) {
      throw Exception('Error fetching product: $e');
    }
  }
}