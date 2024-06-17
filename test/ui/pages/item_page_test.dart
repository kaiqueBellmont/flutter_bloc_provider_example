// test/ui/pages/item_page_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_provider_example/blocs/item_bloc.dart';
import 'package:flutter_bloc_provider_example/ui/pages/item_page.dart';

void main() {
  testWidgets('ItemPage smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (context) => ItemBloc(),
          child: ItemPage(),
        ),
      ),
    );

    // Verify that the initial state is an empty list.
    expect(find.text('Adicionar Item'), findsOneWidget);
    expect(find.byType(ListTile), findsNothing);

    // Enter an item name and submit.
    await tester.enterText(find.byType(TextField), 'Item 1');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pump();

    // Verify that the item has been added to the list.
    expect(find.byType(ListTile), findsOneWidget);
    expect(find.text('Item 1'), findsOneWidget);
  });
}
