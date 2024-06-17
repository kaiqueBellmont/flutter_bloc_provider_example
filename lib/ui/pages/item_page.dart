// lib/ui/pages/item_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/item_bloc.dart';
import '../../blocs/item_event.dart';
import '../../blocs/item_state.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemBloc = BlocProvider.of<ItemBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Itens'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: BlocBuilder<ItemBloc, ItemState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.items[index]),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Adicionar Item',
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  itemBloc.add(AddItem(value));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
