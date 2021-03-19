// StateProvider.autoDispose: destroys state if no-longer listened
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_providers_tutorial/widgets/text_widget.dart';

final stateProvider = StateProvider<int>((ref) => 0);

class StateProviderPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final provider = watch(stateProvider);
    final counter = provider.state.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('StateProvider'),
      ),
      body: Center(child: TextWidget(counter)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // provider.state++;
          final provider = context.read(stateProvider);
          provider.state++;
        },
      ),
    );
  }
}