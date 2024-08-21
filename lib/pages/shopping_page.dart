import 'package:flutter/material.dart';
import 'package:shopsift/components/custom_appbar.dart';
import 'package:shopsift/components/custom_drawer.dart';
import 'package:shopsift/components/product_card.dart';
import 'package:provider/provider.dart';
import '../models/shop.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {

    final products = context.watch<Shop>().shop;
    return  Scaffold(
      appBar: CustomAppBar(
// backgroundColor:
// Colors.transparent,
// elevation: 0,
// foregroundColor: Theme.of(context).colorScheme.inversePrimary,
// title: const Text("Shop Page"),
),
endDrawer: CustomDrawer(),
backgroundColor: Theme.of(context).colorScheme.surface,
body: ListView.builder(
      itemCount: products.length,
      itemBuilder: (context,index){
        //to get each element from shop and display it to customer
        final product = products[index];

        //call the ProductFrame class to display this info on UI
        return ProductCard(product:product);
      }
)
    );
  }
}