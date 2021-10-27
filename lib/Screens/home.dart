import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_work/Provider/cart_provider.dart';
import 'package:shop_work/Screens/cart_screen.dart';
import 'package:shop_work/Widget/badge.dart.dart';
import 'package:shop_work/Widget/drawer.dart';
import 'package:shop_work/Widget/product_grid.dart';

enum FilterOption { Favorites, ShowAll }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _showOnlyFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOption selectVal) {
              if (selectVal == FilterOption.Favorites) {
                setState(() {
                  _showOnlyFav = true;
                });
              } else {
                _showOnlyFav = false;
              }
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Fav'),
                value: FilterOption.Favorites,
              ),
              PopupMenuItem(
                child: Text('ShowAll'),
                value: FilterOption.ShowAll,
              ),
            ],
          ),
          Consumer<Cart>(
              builder: (ctx, cart, child) => Badge(
                    value: cart.itemCount.toString(),
                    child: IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          Navigator.of(context).pushNamed(CartScreen.routeName);
                        }),
                  ))
        ],
      ),
      body: ProductGrid(_showOnlyFav),
      drawer: DrawerApp(),
    );
  }
}
