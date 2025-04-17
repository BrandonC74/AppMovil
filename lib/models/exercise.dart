class Exercise {
  final String id;
  final String name;
  final int reps;
  final int sets;
  final double weight;
  final DateTime date;
  final String? notes;
  final String? imageUrl;
  final String? category;

  Exercise({
    required this.id,
    required this.name,
    required this.reps,
    required this.sets,
    required this.weight,
    required this.date,
    this.notes,
    this.imageUrl,
    this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'reps': reps,
      'sets': sets,
      'weight': weight,
      'date': date.toIso8601String(),
      'notes': notes,
      'imageUrl': imageUrl,
      'category': category,
    };
  }

  factory Exercise.fromMap(Map<String, dynamic> map) {
    return Exercise(
      id: map['id'],
      name: map['name'],
      reps: map['reps'],
      sets: map['sets'],
      weight: map['weight']?.toDouble(),
      date: DateTime.parse(map['date']),
      notes: map['notes'],
      imageUrl: map['imageUrl'],
      category: map['category'],
    );
  }
}
