import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Los androides de la saga Alien aparecen en orden alfabético',
      'Toy Story 2 casi fue borrada',
      'Había un total de 10.297 globos en Up',
    ];

    return Stream.periodic(const Duration(seconds: 3), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        const CircularProgressIndicator(),
        const SizedBox(height: 10),
        const Text('Sabias que: '),
        StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Cargando');

              return Text(snapshot.data!);
            })
      ],
    ));
  }
}
