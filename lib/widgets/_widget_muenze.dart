import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class MuenezUI extends ConsumerWidget {
  final int muenzeWert;
  final VoidCallback onPressed;

  const MuenezUI(
      {required this.muenzeWert, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final snackNotifier = ref.read(refSnackState.notifier);
    return GestureDetector(
      //onTap: () => snackNotifier.zumKundenHinzufuegen(Muenze(muenzeWert)),
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            muenzeWert.toString(),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
