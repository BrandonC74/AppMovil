class Drink {
  final String id;
  final String name;
  final double price;
  final String size;
  final String? imageUrl;
  final String category;

  Drink({
    required this.id,
    required this.name,
    required this.price,
    required this.size,
    this.imageUrl,
    this.category = 'Drinks',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'size': size,
      'imageUrl': imageUrl,
      'category': category,
    };
  }

  factory Drink.fromMap(Map<String, dynamic> map) {
    return Drink(
      id: map['id'],
      name: map['name'],
      price: map['price']?.toDouble(),
      size: map['size'],
      imageUrl: map['imageUrl'],
      category: map['category'] ?? 'Drinks',
    );
  }
}
