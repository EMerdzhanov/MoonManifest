import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:moon_manifest/main.dart';

void main() {
  testWidgets('MoonManifest smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: MoonManifestApp()),
    );

    expect(find.text('MoonManifest'), findsOneWidget);
  });
}
