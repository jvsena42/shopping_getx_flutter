import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_getx_flutter/controller/order_controller.dart';

class OrderScreen extends StatelessWidget {
  var orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yours Orders"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderController.orders.length,
        itemBuilder: (context, index) => OrderItem(
          orderController.orders[index],
        ),
      ),
    );
  }
}
