class Student {
  final int id;
  final String name;
  final String className;
  final String code;

  Student({
    required this.id,
    required this.name,
    required this.className,
    required this.code,
  });

  Student copyWith({
    int? id,
    String? name,
    String? className,
    String? code,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      className: className ?? this.className,
      code: code ?? this.code,
    );
  }
}
