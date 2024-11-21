import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_31_10/muenze.dart';
import 'package:snackautomat_31_10/widgets/widget_muenze.dart';
import "package:snackautomat_31_10/provider.dart";

class BuildKundenPortemonnaie extends ConsumerWidget {
  const BuildKundenPortemonnaie({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snackState = ref.watch(refSnackState);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2),
        color: const Color.fromARGB(181, 0, 0, 0),
      ),
      height: 150,
      width: 800,
      child: Column(children: [
        Text(
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          'Dein  Wert an Münzen :   ${snackState.betragKundenSpeicher} Cent',
        ),
        Column(
          children: [
            const Center(child: KundenPortemonnaieWidget()),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Text(
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                (snackState.kundenSpeicher.muenzen.isEmpty)
                    ? "Dein Portemonnaie ist leer, füge dir Münzen hinzu"
                    : "Drücke auf die Münzen um sie in den Automaten zu werfen",
              ),
            ),
          ],
        )
        // MuenezUI(muenze: 10, snackNotifier.einwerfen(Muenze(10)));
      ]),
    );
  }
}

class KundenPortemonnaieWidget extends ConsumerWidget {
  const KundenPortemonnaieWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> returnWidgets = [];

    List<Muenze> muenzen =
        ref.watch(refSnackState).kundenSpeicher.muenzen.toList();
    // List<Muenze> muenzen = ref
    //     .watch(
    //       refSnackState.select((value) => value.kundenSpeicher),
    //     )
    // .toList();
    muenzen.sort((a, b) => a.wert.compareTo(b.wert));
    //muenzen sind sortiert

    // var lastWert = 0
    // var anzahl = 0

    // for (var m in muenzen) {
    //if muenze.wert == lastWert
    //anzahl++
    //else
    //anzahl = 1
    Muenze? lastMuenze;
    int anzahl = 0;
    for (int i = 0; i < muenzen.length; i++) {
      if (lastMuenze == null) {
        lastMuenze = muenzen[i];
        anzahl = 1;
        continue;
      }
      if (muenzen[i].wert == lastMuenze.wert) {
        anzahl++;
        continue;
      }
      returnWidgets.add(Row(
        children: [
          MuenezUI(
            muenze: lastMuenze,
          ),
          const SizedBox(width: 8),
          Text(
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              "Anzahl: $anzahl"),
        ],
      ));

      anzahl = 1;
      lastMuenze = muenzen[i];
    }
    if (lastMuenze != null) {
      returnWidgets.add(Row(
        children: [
          MuenezUI(
            muenze: lastMuenze,
          ),
          const SizedBox(width: 8),
          Text(
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              "Anzahl: $anzahl"),
        ],
      ));
    }
    return Row(
      children: returnWidgets,
    );
  }
}
