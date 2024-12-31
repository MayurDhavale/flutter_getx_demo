import 'package:get/get.dart';
import 'package:getx_flutter_demo/model/product.dart';

class ShoppingController extends GetxController {
  // Correct initialization of RxList
  var products = RxList<Product>();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));  // Simulate network delay
    var productResult = [
      Product(1, 'FirstProd', 'ADB', 'SOME des adout', 30),
      Product(2, 'SecondProd', 'ADB', 'SOME des adout!!!!', 40),
      Product(3, 'thirdProd', 'ADB', 'SOME des adout???', 50),
    ];
    products.assignAll(productResult);  // Update the observable list
  }
}
