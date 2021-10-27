import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_work/Provider/cart_provider.dart';
import 'package:shop_work/Provider/product.dart';
import 'package:shop_work/Screens/prod_details.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // for fav
    final prod = Provider.of<Product>(context);
    // for Cart
    final cart = Provider.of<Cart>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailes.routeName, arguments: prod.id);
          },
          child: Image.network(
            prod.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
              icon: Icon(
                prod.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                prod.toggleFavState();
              }),
          title: Text(prod.title , textAlign: TextAlign.center,),
          trailing: IconButton(
              icon: Icon(Icons.shopping_cart,
                  color: Theme.of(context).accentColor),
              onPressed: () {
                cart.addItem(prod.id, prod.price, prod.title);
              }),
        ),
      ),
    );
  }
}
