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
      height: 680,
      width: 1400,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: snackState.produkte.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Anzahl der Spalten
            crossAxisSpacing: 40, // Abstand zwischen den Spalten
            mainAxisSpacing: 40, // Abstand zwischen den Reihen
            // childAspectRatio: 1, // Verhältnis von Breite zu Höhe der Elemente
            mainAxisExtent: 380,
          ),
          itemBuilder: (context, index) {
            final p = snackState.produkte[index];
            return InkWell(
              onTap: () => snackState.gewaehltesProdukt?.id == p.id
                  ? snackNotifier.produktWaehlen(null)
                  : snackNotifier.produktWaehlen(p),
              child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 320,
                  width: 360,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: snackState.gewaehltesProdukt?.id == p.id
                            ? Colors.green
                            : Colors.black,
                        width: 10,
                      )),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 5),
                        Text(p.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Image.asset(
                          p.bild,
                          height: 200,
                          // width: 240,
                          fit: BoxFit.contain,
                        ),
                        Text("${p.preis} Cent"),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            onPressed: () => snackNotifier.kaufen(context),
                            child: const Text("Produkt kaufen")),
                        SizedBox(height: 5),
                      ])),
            );
          },
        ),
      ),
    );
  }
}
