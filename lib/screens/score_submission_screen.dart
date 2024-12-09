import 'package:flutter/material.dart';
import '../models/team.dart';
import '../services/round_service.dart';

class ScoreSubmissionScreen extends StatefulWidget {
  final Team team;

  const ScoreSubmissionScreen({Key? key, required this.team}) : super(key: key);

  @override
  _ScoreSubmissionScreenState createState() => _ScoreSubmissionScreenState();
}

class _ScoreSubmissionScreenState extends State<ScoreSubmissionScreen> {
  final TextEditingController remarksController = TextEditingController();
  Map<String, int> scores = {};
  bool isLoading = false;
  int selectedCheckpoint = 1;

  void submitScores() async {
    setState(() => isLoading = true);

    try {
      await RoundService().submitRound(
        round: {
          'evaluator': 1, // Replace with the current evaluator ID
          'team': widget.team.id,
          'round': selectedCheckpoint,
          'score': scores,
          'remarks': remarksController.text,
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Scores submitted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error submitting scores: $e')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Score Submission - ${widget.team.name}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<int>(
              value: selectedCheckpoint,
              onChanged: (value) {
                setState(() => selectedCheckpoint = value!);
              },
              items: List.generate(3, (index) {
                final checkpoint = index + 1;
                return DropdownMenuItem(
                  value: checkpoint,
                  child: Text('Checkpoint $checkpoint'),
                );
              }),
            ),
            ...['Uniqueness', 'Novelty', 'Presentation'].map((metric) {
              return TextField(
                decoration: InputDecoration(labelText: '$metric Score'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  scores[metric] = int.tryParse(value) ?? 0;
                },
              );
            }).toList(),
            TextField(
              controller: remarksController,
              decoration: InputDecoration(labelText: 'Remarks'),
            ),
            SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: submitScores,
              child: Text('Submit Scores'),
            ),
          ],
        ),
      ),
    );
  }
}
