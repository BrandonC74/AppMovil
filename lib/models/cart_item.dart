import 'burger.dart';
import 'drink.dart';

class CartItem {
  final dynamic product; 
  final int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  double get totalPrice => product.price * quantity;

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    final productMap = map['product'] as Map<String, dynamic>;
    final product = productMap['category'] == 'Drinks' 
        ? Drink.fromMap(productMap) 
        : Burger.fromMap(productMap);
        
    return CartItem(
      product: product,
      quantity: map['quantity'],
    );
  }
}
