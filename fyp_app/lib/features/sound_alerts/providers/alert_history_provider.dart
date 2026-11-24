import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/danger_alert.dart';

final alertHistoryListProvider = StateProvider<List<DangerAlert>>((ref) => []);
