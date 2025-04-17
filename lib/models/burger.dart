class Burger {
  final String id;
  final String name;
  final double price;
  final List<String> ingredients;
  final String? imageUrl;
  final String category;

  Burger({
    required this.id,
    required this.name,
    required this.price,
    required this.ingredients,
    this.imageUrl,
    this.category = 'Burgers',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'ingredients': ingredients,
      'imageUrl': imageUrl,
      'category': category,
    };
  }

  factory Burger.fromMap(Map<String, dynamic> map) {
    return Burger(
      id: map['id'],
      name: map['name'],
      price: map['price']?.toDouble(),
      ingredients: List<String>.from(map['ingredients']),
      imageUrl: map['imageUrl'],
      category: map['category'] ?? 'Burgers',
    );
  }
}
