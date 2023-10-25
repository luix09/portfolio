import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:portfolio_web/main.dart';

void main() {
  group('Hello widget tests', () {
    testWidgets('Check main title', (WidgetTester tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(MyApp()));
      final titleFinder = find.text('Luigi Cuomo,\nMobile developer.');
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('Check bottom section', (WidgetTester tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(MyApp()));
      final mobileAndWebfinder = find.text("Mobile and \nWeb Developer");
      expect(mobileAndWebfinder, findsOneWidget);

      final phonefinder = find.text("Phone:\n+39 392 162 1390");
      expect(phonefinder, findsOneWidget);

      final contactfinder = find.text("Contact me:\ncuomoluigi09@gmail.com");
      expect(contactfinder, findsOneWidget);
    });
  });
}