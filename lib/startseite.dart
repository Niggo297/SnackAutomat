import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_31_10/admin_seite.dart';
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
            child: Center(
              child: Container(
                  height: 1000,
                  width: 1600,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.green],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
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
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            // PIN-Abfrage anzeigen
                            bool pinKorrekt = await zeigePinDialog(context);

                            if (pinKorrekt) {
                              // Wenn PIN korrekt, zur Admin-Seite navigieren
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AdminSeite()),
                              );
                            } else {
                              // Fehlermeldung bei falscher PIN
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Falsche PIN!")),
                              );
                            }
                          },
                          child: const Icon(Icons.settings),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Gekauftes Produkt:  "),
                          Text(snackState.gekauftesProdukt?.name ??
                              "Kein Produkt gekauft"),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () => snackNotifier.produktEntnehmen(),
                          child: Text("Produkt entnehmen")),
                      //   Image(image: AssetImage("assets/images/chips.jpg")),
                    ],
                  )),
            ),
          ),

          //   NavigationRail(
          //
          //      destinations: destinations, selectedIndex: selectedIndex)
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text("Gekauftes Produkt:      "),
          //     Text(snackState.gekauftesProdukt?.name ?? "Kein Produkt gekauft"),
          //   ],
          // ),
          // ElevatedButton(
          //     onPressed: () => snackNotifier.produktEntnehmen(),
          //     child: Text("entnehmen")),
          // Text("Münzspeicher: ${snackState.betragMuenzspeicher}"),
        ],
      ),
    );
  }

  Future<bool> zeigePinDialog(BuildContext context) async {
    final TextEditingController pinController = TextEditingController();
    const richtigePin = "1234"; // Hier die gewünschte PIN festlegen

    // Zeige einen Dialog an
    return await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("PIN eingeben"),
              content: TextField(
                controller: pinController,
                keyboardType: TextInputType.number,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Admin-PIN",
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false); // Abbrechen
                  },
                  child: const Text("Abbrechen"),
                ),
                TextButton(
                  onPressed: () {
                    // Überprüfe die eingegebene PIN
                    if (pinController.text == richtigePin) {
                      Navigator.of(context).pop(true); // PIN korrekt
                    } else {
                      Navigator.of(context).pop(false); // PIN falsch
                    }
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        ) ??
        false; // Standardwert, falls der Dialog geschlossen wird
  }
}
