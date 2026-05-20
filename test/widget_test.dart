import 'package:flutter_test/flutter_test.dart';

import 'package:phuongndp_lab1/main.dart';

void main() {
  testWidgets('Product screen shows default products', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Product Manager'), findsOneWidget);
    expect(find.text('Laptop'), findsOneWidget);
    expect(find.text('Phone'), findsOneWidget);
    expect(find.text('Headphone'), findsOneWidget);
  });

  testWidgets('Increase 10 percent updates prices', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Increase 10%'));
    await tester.pump();

    expect(find.text(r'$1650.00'), findsOneWidget);
  });
}
