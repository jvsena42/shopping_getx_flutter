import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_getx_flutter/constants/colors.dart';
import 'package:shopping_getx_flutter/constants/tags.dart';
import 'package:shopping_getx_flutter/controller/cart_controller.dart';
import 'package:shopping_getx_flutter/controller/product_controller.dart';
import 'package:shopping_getx_flutter/screens/product_details_screen.dart';

class ProductsGrid extends StatelessWidget {
  final controller = Get.put(ProductController());
  final cartController = Get.put(CartController());
  final bool isFavorite;

  ProductsGrid({this.isFavorite = false});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: isFavorite ? controller.favouriteItems.length : controller.items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        var item = isFavorite ? controller.favouriteItems[index] : controller.items[index];
        return GetBuilder(
          init: ProductController(),
          builder: (value) => ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    ProductDetailsScreen(
                      item.productTitle,
                      item.price,
                      item.imageUrl,
                      item.description,
                    ),
                  );
                },
                child: Hero(
                  tag: tagProduct,
                  child: Image.network(
                    item.imageUrl ,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black87,
                leading: IconButton(
                  icon: Icon(
                    item.isFavourite == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () {
                    controller.toggleFavouriteStatus(index);
                  },
                ),
                title: Text(
                  item.productTitle,
                  textAlign: TextAlign.center,
                ),
                trailing: GetBuilder<CartController>(
                    init: CartController(),
                    builder: (cont) {
                      return IconButton(
                        icon: const Icon(Icons.shopping_cart),
                        onPressed: () {
                          cartController.addItem(
                              controller.items[index].id,
                              controller.items[index].price,
                              controller.items[index].productTitle,
                              1);
                          Get.snackbar(
                              "Success", "order sent to shopping cart",
                              backgroundColor: colorSnackbar,
                              snackPosition: SnackPosition.BOTTOM);
                        },
                        color: Theme.of(context).accentColor,
                      );
                    }),
              ),
            ),
          ),
        );
      },
    );
  }
}
