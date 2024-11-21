import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_31_10/widgets/widget_porte_kunde.dart';
import 'package:snackautomat_31_10/widgets/bank.dart';
import 'package:snackautomat_31_10/widgets/widget_produkte.dart';
import 'provider.dart';

class Startseite extends ConsumerWidget {
  const Startseite({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final snackState = ref.watch(refSnackState);
    // final snackNotifier = ref.read(refSnackState.notifier);
    final snackState = ref.watch(refSnackState);
    final snackNotifier = ref.watch(refSnackState.notifier);
    return Scaffold(
      body: Column(
        children: [
          // ProduktUI(),
          // Expanded(
          //   child: Container(
          //     height: double.infinity,
          //     // color: Colors.red,
          //     child: Column(
          //       children: [
          //         for (final p in snackState.produkte)
          //           InkWell(
          //             onTap: () {},
          //             child: Container(
          //               decoration: BoxDecoration(
          //                 border: Border.all(),
          //               ),
          //               child: Text(p.name),
          //             ),
          //           ),
          //       ],
          //     ),
          //   ),
          // ),

          const Bank(),
          const BuildKundenPortemonnaie(),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                height: 500,
                decoration: BoxDecoration(
                  border: Border.all(width: 4),
                ),
                child: Column(
                  children: [
                    const Text(
                        style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                        ),
                        "Snackautomat"),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  "Dein aktueller Betrag im Automat :  ${snackState.betragEinwurf} Cent")
                            ],
                          ),
                          Text(
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                              "Dein gewähltes Produkt: ${snackState.gewaehltesProdukt?.name ?? "Kein Produkt gewählt"}"),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () => snackNotifier.abbrechen(),
                              child: const Text(
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  "Transaktion abbrechen"))
                        ],
                      ),
                    ),
                    const ProduktUI(),
                    //   Image(image: AssetImage("assets/images/chips.jpg")),
                  ],
                )),
          ),
          ElevatedButton(
              onPressed: () => snackNotifier.kaufen(),
              child: const Icon(Icons.add)),
          //   NavigationRail(
          //       destinations: destinations, selectedIndex: selectedIndex)
        ],
      ),
    );
  }
}
