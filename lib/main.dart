import 'package:flutter/material.dart';
import 'package:mvc/repository/product_repository.dart';
import 'package:mvc/view/products_view.dart';

import 'controller/product_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController =
        ProductController(ProductRepository());
    return MaterialApp(home: HomeScreen(productController: productController));
  }
}
