import 'dart:convert';

import '../model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  List<Product> _products = [];
  List<Product> get products => _products;
  Future<void> getProducts() async {
    try{
      final response =
      await http.get(Uri.parse("https://fakestoreapi.com/products"));
      print(response.statusCode);
      if (response.statusCode == 200) {
        final List<dynamic> decoded = jsonDecode(response.body);
        _products = decoded.map((e) => Product.fromJson(e)).toList();
        print(_products);
      } else {
        throw Exception("Failed to Load Products ");
      }
    }
    catch(e){
      print(e);
    }

  }
}
