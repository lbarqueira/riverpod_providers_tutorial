import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_providers_tutorial/widgets/text_widget.dart';

final numberProvider = Provider<int>((ref) => 42);

class ProviderPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final int number = watch(numberProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Center(child: TextWidget(number.toString())),
    );
  }
}

// class ProviderPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Provider'),
//       ),
//       body: Center(
//         child: Consumer(
//           builder: (context, watch, child) {
//             final number = watch(numberProvider).toString();

//             return TextWidget(number);
//           },
//         ),
//       ),
//     );
//   }
// }
