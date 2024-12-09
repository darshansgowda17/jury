import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/evaluator.dart';

class EvaluatorService {
  final _supabase = Supabase.instance.client;

  // Fetch evaluator details
  Future<Evaluator?> getEvaluatorByEmail(String email) async {
    final response = await _supabase
        .from('evaluator')
        .select()
        .eq('email', email)
        .single()
        .execute();

    if (response.error != null) {
      throw Exception('Error fetching evaluator: ${response.error!.message}');
    }

    if (response.data == null) return null;

    return Evaluator.fromJson(response.data);
  }
}
