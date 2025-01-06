import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_31_10/muenze.dart';
import 'package:snackautomat_31_10/snack_notifier.dart';
import 'package:snackautomat_31_10/widgets/_widget_muenze.dart';
import "package:snackautomat_31_10/provider.dart";

class Bank extends ConsumerWidget {
  const Bank({super.key});

  List<Widget> baueBank(SnackNotifier snackNotifier) {
    List<Widget> returnWidgets = [];
    const List<Muenze> muenzen = [
      Muenze(5),
      Muenze(10),
      Muenze(20),
      Muenze(50),
      Muenze(100),
      Muenze(200),
    ];

    for (int i = 0; i < muenzen.length; i++) {
      returnWidgets.add(Column(
        children: [
          Row(
            children: [
              MuenezUI(
                muenzeWert: muenzen[i].wert,
                onPressed: () =>
                    snackNotifier.zumKundenHinzufuegen(Muenze(muenzen[i].wert)),
              ),
            ],
          ),
        ],
      ));
    }

    return returnWidgets;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snackNotifier = ref.read(refSnackState.notifier);
    return Container(
      height: 100,
      width: 800,
      decoration: BoxDecoration(
        color: const Color.fromARGB(181, 0, 0, 0),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Column(children: [
        // Text(
        //   'Deine Verfügbaren Betrag:   ${snackState.betragEinwurf} Cent',
        // ),
        Column(
          children: [
            const Text(
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                "Münzen die du dir selber zu deinem Portemonnaie hinzufügen kannst "),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...baueBank(snackNotifier),
                ],
              ),
            )
            //  ' ...baueKundenPortemonnaie(snackNotifier),'
          ],
        )
        // MuenezUI(muenze: 10, snackNotifier.einwerfen(Muenze(10)));
      ]),
    );
  }
}
