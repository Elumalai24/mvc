import '../model/product_model.dart';
import '../repository/product_repository.dart';

class ProductController{
  final ProductRepository productRep;
  ProductController(this.productRep);
  List<Product> get products => productRep.products;
  Future<void> productsApi()async{
    await productRep.getProducts();
  }
}