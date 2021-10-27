import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_work/Provider/orders_provider.dart';
import 'package:shop_work/Widget/drawer.dart';
import 'package:shop_work/Widget/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = './orders';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      drawer: DrawerApp(),
      appBar: AppBar(
        title: Text('Your Order'),
      ),
      body: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (_, i) => OrderItems(orderData.orders[i])),
    );
  }
}
