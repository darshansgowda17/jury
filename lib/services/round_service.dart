import 'package:supabase_flutter/supabase_flutter.dart';

class RoundService {
  final _supabase = Supabase.instance.client;

  // Submit scores for a round
  Future<void> submitRound(Map<String, dynamic> round) async {
    final response = await _supabase.from('round').insert(round).execute();

    if (response.error != null) {
      throw Exception('Error submitting round: ${response.error!.message}');
    }
  }
}
