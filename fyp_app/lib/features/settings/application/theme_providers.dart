import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_app/features/settings/domain/theme_preference.dart';

class ThemePreferenceNotifier extends Notifier<ThemePreference> {
  @override
  ThemePreference build() => ThemePreference.auto;

  // Persistence (local storage) is added in Phase 1 with the profile/settings repository.
  void select(ThemePreference preference) => state = preference;
}

final NotifierProvider<ThemePreferenceNotifier, ThemePreference> themePreferenceProvider =
    NotifierProvider<ThemePreferenceNotifier, ThemePreference>(ThemePreferenceNotifier.new);

final Provider<ThemeMode> themeModeProvider = Provider<ThemeMode>((Ref ref) {
  return switch (ref.watch(themePreferenceProvider)) {
    ThemePreference.light => ThemeMode.light,
    ThemePreference.dark => ThemeMode.dark,
    ThemePreference.auto => ThemeMode.system,
  };
});