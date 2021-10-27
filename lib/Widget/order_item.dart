import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Provider/orders_provider.dart';

class OrderItems extends StatefulWidget {
  final OrdersContain order;

  OrderItems(this.order);
  @override
  _OrderItemsState createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        ListTile(
          title: Text('\$${widget.order.amunt}'),
          subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(widget.order.dateTime)),
          trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              }),
        ),
        if (_expanded)
          Container(
            height: min(widget.order.products.length * 20 + 10.0, 180),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: ListView(
              children: widget.order.products
                  .map((prod) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            prod.title,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${prod.quantity}x \$${prod.price}',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          )
                        ],
                      ))
                  .toList(),
            ),
          )
      ],
    ));
  }
}
