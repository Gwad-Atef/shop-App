import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_work/Provider/cart_provider.dart';
import 'package:shop_work/Provider/orders_provider.dart';
import 'package:shop_work/Provider/products_provider.dart';
import 'package:shop_work/Screens/cart_screen.dart';
import 'package:shop_work/Screens/home.dart';
import 'package:shop_work/Screens/order_screen.dart';
import 'package:shop_work/Screens/prod_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductsProv(),
        ),
        ChangeNotifierProvider.value(value: Orders()),
        ChangeNotifierProvider.value(value: Cart()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        theme: ThemeData(
            primaryColor: Colors.purple, accentColor: Colors.deepOrange),
        home: MyHomePage(),
        routes: {
          ProductDetailes.routeName: (ctx) => ProductDetailes(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrderScreen.routeName: (ctx) => OrderScreen()
        },
      ),
    );
  }
}
