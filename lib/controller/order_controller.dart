import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shopping_getx_flutter/models/cart_item.dart';
import 'package:shopping_getx_flutter/models/order.dart';

class OrderController extends GetxController {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
        0,
        Order(
            orderId: DateTime.now().toString(),
            products: cartProducts,
            amount: total,
            dateTime: DateTime.now()));
    update();
  }
}