import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter_demo/controller/cart_controller.dart';
import 'package:getx_flutter_demo/controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      var product = controller.products[index];
                      return Card(
                        margin: EdgeInsets.all(10.0),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.productName,
                                        style: TextStyle(fontSize: 22.0),
                                      ),
                                      Text(
                                        '\$${product.price.toStringAsFixed(2)}', // Assuming price is a double
                                        style: TextStyle(
                                            fontSize: 16.0, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      cartController.addToCart(
                                          controller.products[index]);
                                    },
                                    label: Text('Add to Cart'),
                                    icon:
                                        Icon(Icons.add_shopping_cart_outlined),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            GetX<CartController>(builder: (controller) {
              return Text(
                'Total Ammount: \$ ${controller.totalPrice}',
                style: TextStyle(fontSize: 30.0, color: Colors.black),
              );
            }),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
