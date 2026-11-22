enum AuthStatus {
  /// No valid session: only splash, onboarding and login are reachable.
  signedOut,

  /// Session exists but onboarding is unfinished: resume onboarding (animated intro 0b logic).
  setupIncomplete,

  /// Session and setup complete: tabs are reachable (static splash 0a logic).
  signedIn,
}