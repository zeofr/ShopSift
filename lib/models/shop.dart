import 'package:flutter/material.dart';

import 'product.dart';

class Shop extends ChangeNotifier{
// products for sale
  final List<Product> _shop=[
// product 1
  Product(
    name: "Product 1",
    price: 99.99,
    description: "Item description", productId: 'd21d'
  ),
//product
  Product(
    name: "Product 2",
    price: 99.99,
    description: "Item description", productId: '121212d'
  ),
//product 3
  Product(
    name: "Product 3",
    price: 99.99,
    description: "Item description", productId: 'q3fqaef'
  ),
//product 4
  Product(
    name: "Product 4",
    price: 99.99,
    description: "Item description", productId: 'f2q3efcwafc'
  )];


// user cart
  List<Product> _cart=[];
// get product list
  List<Product> get shop => _shop;
// get user cart
  List<Product> get cart => _cart;
// add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }
// remove item from cart
  void removefromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}