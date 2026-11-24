import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_app/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: LafzioApp()));
    await tester.pumpAndSettle(const Duration(seconds: 3));
    expect(find.byType(LafzioApp), findsOneWidget);
  });
}
