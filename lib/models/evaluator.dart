class Evaluator {
  final int id;
  final String name;
  final String email;

  Evaluator({
    required this.id,
    required this.name,
    required this.email,
  });

  factory Evaluator.fromJson(Map<String, dynamic> json) {
    return Evaluator(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
