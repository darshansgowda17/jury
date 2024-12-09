class Round {
  final int id;
  final int evaluatorId;
  final int teamId;
  final int roundNumber;
  final Map<String, int> score;
  final String remarks;

  Round({
    required this.id,
    required this.evaluatorId,
    required this.teamId,
    required this.roundNumber,
    required this.score,
    required this.remarks,
  });

  factory Round.fromJson(Map<String, dynamic> json) {
    return Round(
      id: json['id'],
      evaluatorId: json['evaluator'],
      teamId: json['team'],
      roundNumber: json['round'],
      score: Map<String, int>.from(json['score']),
      remarks: json['remarks'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'evaluator': evaluatorId,
      'team': teamId,
      'round': roundNumber,
      'score': score,
      'remarks': remarks,
    };
  }
}
