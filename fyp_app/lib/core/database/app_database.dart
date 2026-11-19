/// Local database helper for SQLite (via sqflite).
/// Stores offline chat messages, cache, and custom sign dictionaries.
class AppDatabase {
  static const String databaseName = 'lafzio.db';
  static const int databaseVersion = 1;

  // Table names
  static const String tableMessages = 'messages';
  static const String tableConversations = 'conversations';
  static const String tableCustomSigns = 'custom_signs';
  static const String tableDangerAlerts = 'danger_alerts';

  AppDatabase._();
  static final AppDatabase instance = AppDatabase._();

  Future<void> initDatabase() async {
    // Database initialization logic with sqflite migrations
  }
}
