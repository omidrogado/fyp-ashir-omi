import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingRoleProvider = StateProvider<String>((ref) => 'deaf');
final onboardingCompleteProvider = StateProvider<bool>((ref) => false);
