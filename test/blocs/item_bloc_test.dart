// test/blocs/item_bloc_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_provider_example/blocs/item_bloc.dart';
import 'package:flutter_bloc_provider_example/blocs/item_event.dart';
import 'package:flutter_bloc_provider_example/blocs/item_state.dart';

void main() {
  group('ItemBloc', () {
    late ItemBloc itemBloc;

    setUp(() {
      itemBloc = ItemBloc();
    });

    tearDown(() {
      itemBloc.close();
    });

    test('initial state is ItemState with an empty list', () {
      expect(itemBloc.state, ItemState([]));
    });

    blocTest<ItemBloc, ItemState>(
      'emits [ItemState with one item] when AddItem is added',
      build: () => itemBloc,
      act: (bloc) => bloc.add(AddItem('Item 1')),
      expect: () => [
        ItemState(['Item 1'])
      ],
    );
  });
}
