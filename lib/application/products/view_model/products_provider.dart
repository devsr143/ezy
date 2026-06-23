import 'package:ezy/application/products/model/model.dart';
import 'package:ezy/application/products/service/product_service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> products = [];
  bool _isLoading = false;
  String? _errorMessage;
  final productService = ProductService();

  ProductProvider() {
    loadProducts();
  }

  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      products = await productService.fetchproducts();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
