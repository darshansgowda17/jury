import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/team.dart';

class TeamService {
  final _supabase = Supabase.instance.client;

  // Fetch all teams
  Future<List<Team>> getTeams() async {
    final response = await _supabase.from('team').select().execute();

    if (response.error != null) {
      throw Exception('Error fetching teams: ${response.error!.message}');
    }

    return (response.data as List).map((team) => Team.fromJson(team)).toList();
  }
}
