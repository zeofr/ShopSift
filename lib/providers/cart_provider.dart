import 'package:flutter/foundation.dart';
import '../models/samaan.dart';

class CartProvider with ChangeNotifier {
  List<Samaan> _cart = [];

  List<Samaan> get cart => _cart;

  void addToCart(Samaan product) {
    if (!_cart.contains(product)) {
      _cart.add(product);
      notifyListeners();
    }
  }

  void removeFromCart(Samaan product) {
    _cart.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
