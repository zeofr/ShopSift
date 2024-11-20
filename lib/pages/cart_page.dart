import 'package:flutter/material.dart';
import 'dart:io';
//components
import 'package:shopsift/components/custom_bottom_navbar.dart';

//models
import '../models/samaan.dart';

//providers
import '../providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          ElevatedButton(
            child: Row(children: [Icon(Icons.delete_forever), Text('Delete All')]),
            onPressed: () {
              cartProvider.clearCart();
            },
          ),
        ],
      ),
      body: cartProvider.cart.isEmpty
          ? Center(child: Text('No items in cart'))
          : SingleChildScrollView(
              child: Column(
                children: cartProvider.cart.map((product) {
                  return CartCard(
                    product: product,
                    onRemove: () => cartProvider.removeFromCart(product),
                  );
                }).toList(),
              ),
            ),
    );
  }
}

class CartCard extends StatelessWidget {
  final Samaan product;
  final VoidCallback onRemove;

  CartCard({
    required this.product,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        leading: product.imagePath.isNotEmpty
            ? Image.file(
                File(product.imagePath),
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              )
            : const Icon(Icons.image_not_supported_outlined),
        title: Text(
          product.naam,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        subtitle: Text('\$${product.daam}',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: onRemove,
        ),
      ),
    );
  }
}

