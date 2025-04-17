class Drink {
  final String id;
  final String category;
  final String name;
  final String variety;
  final double price;
  final String size;
  final String imagePath;

  const Drink({
    required this.id,
    required this.category,
    required this.name,
    required this.variety,
    required this.price,
    required this.size,
    required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'name': name,
      'variety': variety,
      'price': price,
      'size': size,
      'imagePath': imagePath,
    };
  }

  factory Drink.fromMap(Map<String, dynamic> map) {
    return Drink(
      id: map['id'],
      category: map['category'],
      name: map['name'],
      variety: map['variety'],
      price: map['price'],
      size: map['size'],
      imagePath: map['imagePath'] ?? 'assets/images/default_drink.png',
    );
  }
}
