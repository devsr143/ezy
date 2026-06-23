import 'dart:convert';

import 'package:ezy/application/products/model/model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static const baseUrl = "https://api.escuelajs.co/api/v1";

  Future<List<ProductModel>> fetchproducts() async {
    final response = await http.get(Uri.parse("$baseUrl/products"));
    if (response.statusCode != 200) {
      throw Exception('Failed to load products');
    }
    final List data = jsonDecode(response.body);
    return data
        .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<ProductModel> fetchCategory() async {
    final response = await http.get(Uri.parse("$baseUrl/categories"));
    if (response.statusCode == 200) {
      throw Exception('Failed to load category');
    }
    final List data = jsonDecode(response.body);
    return data
            .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
            .toList()
        as ProductModel;
  }
}
