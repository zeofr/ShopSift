import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({
    super.key,
    required this.product,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children:[
          //product image
          Icon(Icons.favorite),
          // product name
          Text(product.name),
          // product description
          Text(product. description),
          // product price + add to cart button
          Text(product.price.toStringAsFixed(2)),
        ]
      ), // CoLumn
    );
  }
}