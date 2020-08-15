import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uwtests/todo_view.dart';

void main() {
  MaterialApp material(Widget child) => MaterialApp(
        home: child,
      );

  group("Todo widget test ", () {
    testWidgets("TodoName field", (WidgetTester tester) async {
      await tester.pumpWidget(material(TodoView()));
      final todoField = find.byKey(Key('todo'));
      expect(todoField, findsOneWidget);
    });
  
    testWidgets("Circular Progress Indicator | ListView control",
        (WidgetTester tester) async {
      await tester.pumpWidget(material(TodoView()));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byKey(Key('listview')), findsNothing);
      final todoField = find.byKey(Key('todo'));
      await tester.enterText(todoField, "Cook Meat");
      await tester.tap(find.byKey(Key('add')));
      await tester.pump();
      expect(find.byType(ListView), findsOneWidget);
    });
  });
}
