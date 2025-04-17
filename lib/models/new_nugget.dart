class Nugget {
  final String id;
  final String category;
  final String name;
  final String variety;
  final double price;
  final int pieces;
  final List<String> sauces;
  final List<String> sides;
  final String description;

  final String imagePath; 

  const Nugget({
    required this.id,
    required this.category,
    required this.name,
    required this.variety,
    required this.price,
    required this.pieces,
    required this.sauces,
    required this.sides,
    required this.description,
    required this.imagePath, 
  });
}
