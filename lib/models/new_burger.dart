class Burger {
  final String id;
  final String category;
  final String name;
  final String variety;
  final double price;
  final String description;
  final List<String> ingredients;

  final String imagePath; 

  const Burger({
    required this.id,
    required this.category,
    required this.name,
    required this.variety,
    required this.price,
    required this.description,
    required this.ingredients,
    required this.imagePath, 
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'name': name,
      'variety': variety,
      'price': price,
      'description': description,
      'ingredients': ingredients,
      'imagePath': imagePath,
    };
  }

  factory Burger.fromMap(Map<String, dynamic> map) {
    return Burger(
      id: map['id'],
      category: map['category'],
      name: map['name'],
      variety: map['variety'],
      price: map['price'],
      description: map['description'],
      ingredients: List<String>.from(map['ingredients']),
      imagePath: map['imagePath'] ?? 'assets/images/products/default_burger.png',
    );
  }
}
