import 'package:ezy/application/products/model/model.dart';
import 'package:ezy/application/products/service/product_service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> products = [];
  bool isLoading = false;
  String? errorMessage;
  final productService = ProductService();

  ProductProvider() {
    loadProducts();
  }

  Future<void> loadProducts() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      products = await productService.fetchproducts();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
