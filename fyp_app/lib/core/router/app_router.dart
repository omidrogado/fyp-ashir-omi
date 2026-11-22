import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_app/core/providers/repository_providers.dart';
import 'package:fyp_app/core/router/app_routes.dart';
import 'package:fyp_app/core/router/app_shell.dart';
import 'package:fyp_app/core/router/auth_guard.dart';
import 'package:fyp_app/features/auth/domain/auth_repository.dart';
import 'package:fyp_app/features/auth/domain/auth_status.dart';
import 'package:fyp_app/shared/widgets/route_placeholder.dart';
import 'package:go_router/go_router.dart';

final Provider<GoRouter> appRouterProvider = Provider<GoRouter>((Ref ref) {
  final AuthRepository auth = ref.watch(authRepositoryProvider);
  final _AuthRefreshListenable refresh = _AuthRefreshListenable(auth.statusChanges);
  ref.onDispose(refresh.dispose);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    refreshListenable: refresh,
    redirect: (BuildContext context, GoRouterState state) =>
        resolveAuthRedirect(status: auth.currentStatus, location: state.matchedLocation),
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.splash,
        builder: (BuildContext context, GoRouterState state) => RoutePlaceholder(
          title: 'Lafzio',
          note: 'Splash 0a / 0b arrive in Phase 1.',
          actionLabel: 'Continue',
          onAction: () => context.go(AppRoutes.chats),
        ),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (BuildContext context, GoRouterState state) => const RoutePlaceholder(
          title: 'Welcome',
          note: 'Onboarding screens 1 to 9 arrive in Phase 1.',
        ),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (BuildContext context, GoRouterState state) => const RoutePlaceholder(
          title: 'Log in',
          note: 'Login arrives in Phase 1.',
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state, StatefulNavigationShell shell) =>
            AppShell(navigationShell: shell),
        branches: <StatefulShellBranch>[
          _branch(AppRoutes.chats, 'Chats', 'Chat list and conversation arrive in Phase 2.'),
          _branch(AppRoutes.calls, 'Calls', 'Video calling arrives in Phase 5.'),
          _branch(AppRoutes.signs, 'Signs', 'Sign dictionary arrives in Phase 3.'),
          _branch(AppRoutes.translate, 'Translate', 'Speech to sign arrives in Phase 4.'),
          _branch(AppRoutes.me, 'Me', 'Settings arrive in Phase 4.'),
        ],
      ),
    ],
  );
});

StatefulShellBranch _branch(String path, String title, String note) {
  return StatefulShellBranch(
    routes: <RouteBase>[
      GoRoute(
        path: path,
        builder: (BuildContext context, GoRouterState state) =>
            RoutePlaceholder(title: title, note: note),
      ),
    ],
  );
}

/// Re-runs the redirect whenever the auth status changes.
class _AuthRefreshListenable extends ChangeNotifier {
  _AuthRefreshListenable(Stream<AuthStatus> statuses) {
    _subscription = statuses.listen((AuthStatus _) => notifyListeners());
  }

  late final StreamSubscription<AuthStatus> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}