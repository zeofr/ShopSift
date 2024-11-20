import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';

import '../components/custom_appbar.dart';
import '../components/custom_bottom_navbar.dart';
import '../components/custom_drawer.dart';
import '../models/samaan.dart';
import '../providers/samaan_provider.dart';
import '../providers/cart_provider.dart';

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final samaanProvider = Provider.of<SamaanProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(),
      endDrawer: CustomDrawer(),
      bottomNavigationBar: CustomBottomNavBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: samaanProvider.samaanList.map((product) {
            final isBookmarked = cartProvider.cart.contains(product);
            return SamaanCard(
              product: product,
              isBookmarked: isBookmarked,
              onBookmark: () {
                if (isBookmarked) {
                  cartProvider.removeFromCart(product);
                } else {
                  cartProvider.addToCart(product);
                }
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}

class SamaanCard extends StatelessWidget {
  final Samaan product;
  final bool isBookmarked;
  final VoidCallback onBookmark;

  SamaanCard({
    required this.product,
    required this.isBookmarked,
    required this.onBookmark,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (product.imagePath.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.file(
                          File(product.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                else
                  Container(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Icon(Icons.image_not_supported_outlined),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.naam,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      Text(
                        product.soochna,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${product.daam}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  IconButton(
                    icon: Icon(
                      isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      color: isBookmarked ? Colors.blue : null,
                    ),
                    onPressed: onBookmark,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
