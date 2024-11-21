import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snackautomat_31_10/provider.dart';
import 'package:snackautomat_31_10/muenze.dart';

class MuenezUI extends ConsumerWidget {
  final Muenze muenze;

  const MuenezUI({required this.muenze, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snackNotifier = ref.watch(refSnackState.notifier);
    // final muenzeEntfern = ref.watch(
    //   refSnackState.select((value) => value.kundenSpeicher.betrag),
    // );

    return GestureDetector(
      onTap: () => snackNotifier.vomKundenZumEinwurfHinzufuegen(muenze),

      //onTap: onPressed,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            muenze.wert.toString(),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}