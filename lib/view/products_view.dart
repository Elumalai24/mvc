import 'package:flutter/material.dart';

import '../controller/product_controller.dart';

class HomeScreen extends StatefulWidget {
  final ProductController productController;
  const HomeScreen({Key? key, required this.productController})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: widget.productController.productsApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return ListView.builder(
              itemCount: widget.productController.products.length,
              itemBuilder: (context, index) {
                final product = widget.productController.products[index];
                return ListTile(
                  leading: Image.network(product.imageUrl),
                  title: Text(product.title),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
