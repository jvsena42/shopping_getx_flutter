import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_getx_flutter/controller/cart_controller.dart';
import 'package:shopping_getx_flutter/widget/app_drawer.dart';
import 'package:shopping_getx_flutter/widget/product_grid.dart';

import 'cart_screen.dart';

class ProductOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Shop"),
        centerTitle: true,
        actions: <Widget>[
          GetBuilder<CartController>(
              init: CartController(),
              builder: (context) {
                return GestureDetector(
                  child: IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                    ),
                    onPressed: () {
                      Get.to(() => CartScreen());
                    },
                  ),
                );
              })
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(),
    );
  }
}
