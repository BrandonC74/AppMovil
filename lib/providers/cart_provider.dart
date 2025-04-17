import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => [..._items];

  double get totalAmount {
    return _items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  void addItem(dynamic product, int quantity) {
    final existingIndex = _items.indexWhere((item) => 
        item.product.id == product.id && 
        item.product.runtimeType == product.runtimeType);

    if (existingIndex >= 0) {
      _items[existingIndex] = CartItem(
        product: product,
        quantity: _items[existingIndex].quantity + quantity,
      );
    } else {
      _items.add(CartItem(
        product: product,
        quantity: quantity,
      ));
    }
    notifyListeners();
  }

  void removeItem(String productId, Type productType) {
    _items.removeWhere((item) => 
        item.product.id == productId && 
        item.product.runtimeType == productType);
    notifyListeners();
  }

  void updateQuantity(String productId, Type productType, int newQuantity) {
    final index = _items.indexWhere((item) => 
        item.product.id == productId && 
        item.product.runtimeType == productType);
        
    if (index >= 0) {
      _items[index] = CartItem(
        product: _items[index].product,
        quantity: newQuantity,
      );
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
