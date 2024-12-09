class Team {
  final int id;
  final String name;
  final String topic;
  final String email;
  final int? cpt1; // Nullable to handle scenarios where scores may not yet exist
  final int? cpt2;
  final int? cpt3;
  final int? test1;
  final int? finalScore;

  Team({
    required this.id,
    required this.name,
    required this.topic,
    required this.email,
    this.cpt1,
    this.cpt2,
    this.cpt3,
    this.test1,
    this.finalScore,
  });

  // Factory method to create a Team object from JSON data
  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      topic: json['topic'],
      email: json['email'],
      cpt1: json['cpt1'],
      cpt2: json['cpt2'],
      cpt3: json['cpt3'],
      test1: json['test1'],
      finalScore: json['final'],
    );
  }

  // Convert a Team object to JSON (useful for sending data to the backend)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'topic': topic,
      'email': email,
      'cpt1': cpt1,
      'cpt2': cpt2,
      'cpt3': cpt3,
      'test1': test1,
      'final': finalScore,
    };
  }
}
