/// Application configuration and environment settings.
class AppConfig {
  static const String appName = 'Lafzio';
  static const String appTagline = 'Say it your way.';

  // Supabase Configuration (loaded via env / compile-time define)
  static const String supabaseUrl = String.fromEnvironment('SUPABASE_URL', defaultValue: '');
  static const String supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY', defaultValue: '');

  // FastAPI ML / Backend Configuration
  static const String fastApiBaseUrl = String.fromEnvironment('FASTAPI_BASE_URL', defaultValue: 'http://10.0.2.2:8000');

  // Timeouts & Policies
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 30);
}
