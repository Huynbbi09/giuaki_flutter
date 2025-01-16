class Book {
  final int id;
  final String title;
  final String description;
  final String author;
  final int quantity;

  Book({
    required this.id,
    required this.title,
    required this.description,
    required this.author,
    required this.quantity,
  });

  Book copyWith({
    int? id,
    String? title,
    String? description,
    String? author,
    int? quantity,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      author: author ?? this.author,
      quantity: quantity ?? this.quantity,
    );
  }
}
