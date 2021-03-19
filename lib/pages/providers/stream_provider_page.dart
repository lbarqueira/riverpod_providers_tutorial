// StreamProvider.autoDispose: destroys state if no-longer listened
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_providers_tutorial/widgets/text_widget.dart';

final streamProvider = StreamProvider<String>((ref) => Stream.periodic(
      Duration(milliseconds: 400),
      (count) => '$count',
    ));

class StreamProviderPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) => Scaffold(
        appBar: AppBar(
          title: Text('StreamProvider'),
        ),
        body: Center(child: buildStreamWhen(watch)),
        // Center(child: buildStreamBuilder(watch)),
      );

  Widget buildStreamWhen(watch) {
    final stream = watch(streamProvider);

    return stream.when(
      data: (value) => TextWidget(value),
      loading: () => CircularProgressIndicator(),
      error: (e, stack) => TextWidget('Error: $e'),
    );
  }

  // Widget buildStreamBuilder(watch) {
  //   final stream = watch(streamProvider.stream);

  //   return StreamBuilder<String>(
  //     stream: stream,
  //     builder: (context, snapshot) {
  //       switch (snapshot.connectionState) {
  //         case ConnectionState.waiting:
  //           return CircularProgressIndicator();
  //         default:
  //           if (snapshot.hasError) {
  //             return TextWidget('Error: ${snapshot.error}');
  //           } else {
  //             final counter = snapshot.data;

  //             return TextWidget(counter);
  //           }
  //       }
  //     },
  //   );
  // }
}