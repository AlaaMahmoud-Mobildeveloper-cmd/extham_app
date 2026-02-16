import 'package:extham_app/model/model.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {
  List<Product> cart = [];
  int cartCount = 0;
  int countProduct=0;
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
  void incrementCount(Product product){
    countProduct++;
    notifyListeners();
  }
  void decrementCount(Product product){
    countProduct--;
    notifyListeners();
  }
  void clearCart() {
    cart.clear();
    cartCount = 0;
    notifyListeners();
  }

}