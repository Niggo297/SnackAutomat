import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_31_10/provider.dart';

class ProduktUI extends ConsumerWidget {
  // final VoidCallback onPressed;

  const ProduktUI({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final snackState = ref.watch(refSnackState);
//     // final snackNotifier = ref.read(refSnackState.notifier);
//     return Container(
//       height: 300,
//       width: 400,
//       color: Colors.red,
//       child: Column(
//         children: [
//           for (final p in snackState.produkte)
//             Column(
//               children: [
//                 InkWell(
//                   onTap: () {},
//                   child: SizedBox(
//                     child: Text(p.name),
//                   ),
//                 ),
//                 Image.asset(
//                   p.bild,
//                   height: 50,
//                   width: 50,
//                   fit: BoxFit.cover,
//                 ),
//               ],
//             ),
//         ],
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snackState = ref.watch(refSnackState);
    final snackNotifier = ref.watch(refSnackState.notifier);
    // final snackNotifier = ref.read(refSnackState.notifier);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        color: const Color.fromARGB(181, 0, 0, 0),
      ),
      height: 380,
      width: 700,
      child: GridView.builder(
        itemCount: snackState.produkte.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Anzahl der Spalten
          crossAxisSpacing: 1.0, // Abstand zwischen den Spalten
          mainAxisSpacing: 120, // Abstand zwischen den Reihen
          childAspectRatio: 1, // Verhältnis von Breite zu Höhe der Elemente
        ),
        itemBuilder: (context, index) {
          final p = snackState.produkte[index];
          return InkWell(
            onTap: () => snackState.gewaehltesProdukt?.id == p.id
                ? snackNotifier.produktWaehlen(null)
                : snackNotifier.produktWaehlen(p),
            child: Column(
              children: [
                Container(
                    height: 300,
                    width: 250,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(children: [
                      Text(p.name),
                      Image.asset(
                        p.bild,
                        // height: 80,
                        // width: 240,
                        fit: BoxFit.contain,
                      ),
                      Text("${p.preis} Cent"),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Produkt kaufen")),
                    ])),
              ],
            ),
          );
        },
      ),
    );
  }
}
