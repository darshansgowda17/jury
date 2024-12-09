import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/evaluator.dart';

class AuthService {
  final _supabase = Supabase.instance.client;

  // Log in an evaluator using email and password
  Future<bool> login(String email, String password) async {
    final response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.error != null) {
      throw Exception('Login failed: ${response.error!.message}');
    }

    return response.user != null;
  }

  // Log out the current user
  Future<void> logout() async {
    final response = await _supabase.auth.signOut();

    if (response.error != null) {
      throw Exception('Logout failed: ${response.error!.message}');
    }
  }

  // Get the current logged-in evaluator details
  Future<Evaluator?> getCurrentEvaluator() async {
    final user = _supabase.auth.currentUser;

    if (user == null) {
      return null;
    }

    final response = await _supabase
        .from('evaluator')
        .select()
        .eq('email', user.email)
        .single()
        .execute();

    if (response.error != null) {
      throw Exception('Error fetching evaluator: ${response.error!.message}');
    }

    if (response.data == null) return null;

    return Evaluator.fromJson(response.data);
  }

  // Check if a user is logged in
  bool isLoggedIn() {
    return _supabase.auth.currentUser != null;
  }
}
