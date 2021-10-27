import 'package:flutter/cupertino.dart';
import 'package:shop_work/Provider/cart_provider.dart';

class OrdersContain {
  final String id;
  final double amunt;
  final List<ContainCart> products;
  final DateTime dateTime;

  OrdersContain({this.id, this.amunt, this.products, this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrdersContain> _orders = [];

  List<OrdersContain> get orders {
    return [..._orders];
  }

  void addOrders(List<ContainCart> cartProd, double total) {
    _orders.insert(
        0,
        OrdersContain(
          id: DateTime.now().toString(),
          amunt: total,
          dateTime: DateTime.now(),
          products: cartProd,
        ));
    notifyListeners();
  }
}
