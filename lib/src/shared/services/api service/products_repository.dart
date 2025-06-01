import 'dart:convert';
import 'package:flutter/services.dart';
import '../../../features/product/models/product_response_dto.dart'; // make sure this path matches your model file

class ProductsRepository {
  Future<ProductListModel> fetchProducts() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/products.json');
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      return ProductListModel.fromJson(jsonMap);
    } catch (e) {
      return ProductListModel.empty();
    }
  }

  /// Get single product by ID
  ///
  Future<ProductModel> getProductById(int id) async {
    try {
      final productList = await fetchProducts();
      return productList.products.firstWhere(
        (product) => product.id == id,
        orElse: () =>
            ProductModel.empty(), 
      );
    } catch (e) {
      return ProductModel.empty();
    }
  }
}
