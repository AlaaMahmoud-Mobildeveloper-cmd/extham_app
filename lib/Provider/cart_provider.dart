import 'package:extham_app/model/model.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {
  List<Product> cart = [];
  int cartCount = 0;
  Map<Product, int> _productCounts = {};
  void addToCart(Product product) {
    cart.add(product);
    cartCount++;
    notifyListeners();
  }

  void removeFromCart(Product product) {
    cart.remove(product);
    cartCount--;
    notifyListeners();
  }
  double getTotalPrice() {
    double totalPrice = 0.0;
    for (var product in cart) {
      totalPrice += product.price ?? 0.0;
    }
    return totalPrice;
  }


  int getCount(Product product) {
    return _productCounts[product] ?? 0;
  }

  void incrementCount(Product product) {
    _productCounts[product] = (_productCounts[product] ?? 0) + 1;
    notifyListeners();
  }

  void decrementCount(Product product) {
    if ((_productCounts[product] ?? 0) > 0) {
      _productCounts[product] = _productCounts[product]! - 1;
      notifyListeners();
    }
  }
  void clearCart() {
    cart.clear();
    cartCount = 0;
    notifyListeners();
  }

}