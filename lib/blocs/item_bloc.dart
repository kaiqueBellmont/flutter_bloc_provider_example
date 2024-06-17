// lib/blocs/item_bloc.dart
import 'package:bloc/bloc.dart';
import 'item_event.dart';
import 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemState([])) {
    on<AddItem>((event, emit) {
      final updatedItems = List<String>.from(state.items)..add(event.itemName);
      emit(ItemState(updatedItems));
    });
  }
}
