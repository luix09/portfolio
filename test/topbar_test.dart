// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:portfolio_web/main.dart';
import 'package:portfolio_web/widgets/about_me_widget.dart';
import 'package:portfolio_web/widgets/hello_widget.dart';
import 'package:portfolio_web/widgets/projects_container.dart';
import 'package:portfolio_web/widgets/skills_container.dart';

void main() {
  group('Top bar tests', () {

    // DESKTOP TESTS
    testWidgets('Check Home button on desktop', (WidgetTester tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(MyApp()));
      final homeFinder = find.text('Home');
      expect(homeFinder, findsOneWidget);
      await tester.tap(homeFinder);
      await tester.pumpAndSettle();
      expect(find.byType(HelloWidget), findsOneWidget);
    });

    testWidgets('Check Skills button on desktop', (WidgetTester tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(MyApp()));
      final skillsFinder = find.text('Skills');
      expect(skillsFinder, findsOneWidget);
      await tester.tap(skillsFinder);
      await tester.pumpAndSettle();
      expect(find.byType(SkillsContainer), findsOneWidget);
    });

    testWidgets('Check Projects button on desktop', (WidgetTester tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(MyApp()));
      final projectsFinder = find.text('Projects');
      expect(projectsFinder, findsOneWidget);
      await tester.tap(projectsFinder);
      await tester.pumpAndSettle();
      expect(find.byType(ProjectsContainer), findsOneWidget);
    });

    testWidgets('Check About me button on desktop', (WidgetTester tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(MyApp()));
      final aboutMeFinder = find.text('About Me');
      expect(aboutMeFinder, findsOneWidget);
      await tester.tap(aboutMeFinder);
      await tester.pumpAndSettle();
      expect(find.byType(AboutMeWidget), findsOneWidget);
    });

    // SMARTPHONE/TABLE TESTS
    testWidgets('Check Home button on mobile', (WidgetTester tester) async {
      tester.binding.window.physicalSizeTestValue = Size(400, 700);
      await mockNetworkImagesFor(() => tester.pumpWidget(MyApp()));

      //opening drawer
      final drawerButton = find.byIcon(Icons.menu);
      await tester.tap(drawerButton);
      await tester.pumpAndSettle();

      final homeFinder = find.text('Home');
      expect(homeFinder, findsOneWidget);
      await tester.tap(homeFinder);
      await tester.pumpAndSettle();
      expect(find.byType(HelloWidget), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
