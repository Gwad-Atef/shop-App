import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_work/Provider/products_provider.dart';
import 'package:shop_work/Widget/product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavs;
  ProductGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProv>(context);
    final products = showFavs ? productsData.favItem : productsData.items;
    return GridView.builder(
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(value: products[i],
      child: ProductItem()  ,
      
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
