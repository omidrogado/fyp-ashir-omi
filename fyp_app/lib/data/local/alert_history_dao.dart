import '../models/danger_alert.dart';

class AlertHistoryDao {
  final List<DangerAlert> _inMemoryAlerts = [];

  Future<void> insertAlert(DangerAlert alert) async {
    _inMemoryAlerts.insert(0, alert);
  }

  Future<List<DangerAlert>> getAlertHistory() async {
    return List.unmodifiable(_inMemoryAlerts);
  }

  Future<void> clearHistory() async {
    _inMemoryAlerts.clear();
  }
}
