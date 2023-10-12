import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://smgaepbxjafvndrbbmjl.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNtZ2FlcGJ4amFmdm5kcmJibWpsIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU3OTgzNjEsImV4cCI6MjAxMTM3NDM2MX0.niAmLkNtPTR5kYp3xjqD_B27WZsh_5ty6hrC5JdIcYA';

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
      );
}
