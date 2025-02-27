import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

String _kSupabaseUrl = 'https://eadflnthowatnupyrimn.supabase.co/';
String _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVhZGZsbnRob3dhdG51cHlyaW1uIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE1MzA0NzUsImV4cCI6MjAyNzEwNjQ3NX0.67oviBMQRH7hu3eSY21EGabmiPp2znPKs4RR7uEWzOU';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
        authOptions:
            const FlutterAuthClientOptions(authFlowType: AuthFlowType.implicit),
      );
}
