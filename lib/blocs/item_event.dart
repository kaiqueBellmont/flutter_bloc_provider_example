// lib/blocs/item_event.dart
abstract class ItemEvent {}

class AddItem extends ItemEvent {
  final String itemName;

  AddItem(this.itemName);
}
