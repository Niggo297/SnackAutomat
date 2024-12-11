import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "provider.dart";
import 'snack_notifier.dart';
import 'snack_state.dart';
import 'adminHinzufuegenSeite.dart';
import 'muenze.dart';

class AdminSeite extends ConsumerWidget {
  const AdminSeite({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snackState = ref.watch(refSnackState);
    final snackNotifier = ref.watch(refSnackState.notifier);
    int anzahl = 0;
    return Scaffold(
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text("Admin Seite",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, shadows: [
            Shadow(
              blurRadius: 20.0,
              color: Colors.black,
              offset: Offset(10.0, 10.0),
            ),
          ])),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
        ),
        onPressed: () {
          // Zurück zur vorherigen Seite
          Navigator.pop(context);
        },
        child: const Text(
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            "Zurück"),
      ),
      Text(
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold, 
          ),
          "Betrag im Automaten: ${snackState.betragMuenzspeicher.toString()}"),
      //
      ElevatedButton(
          onPressed: () => snackNotifier.muenzspeicherLeeren(),
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontSize: 20),
            backgroundColor: Colors.orange,
          ),
          child: Text(
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              "Münzspeicher leeren")),
      Text(
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          "Drücke auf die Münzen um sie dem Automaten hinzuzufügen"),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const MueneAdmin(muenze: Muenze(5)),
          const MueneAdmin(muenze: Muenze(10)),
          const MueneAdmin(muenze: Muenze(20)),
          const MueneAdmin(muenze: Muenze(50)),
          const MueneAdmin(muenze: Muenze(100)),
          const MueneAdmin(muenze: Muenze(200)),
        ],
      ),
    ]));
  }
}
