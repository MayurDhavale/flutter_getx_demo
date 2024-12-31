import 'package:get/get.dart';
import 'package:getx_flutter_demo/model/product.dart';

class CartController extends GetxController {
  var cartItems = RxList<Product>();

  int get count => cartItems.length;

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  addToCart(Product product) {
    cartItems.add(product);
  }
}
