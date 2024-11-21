import 'package:snackautomat_31_10/muenze.dart';
import 'package:snackautomat_31_10/portemonnaie.dart';
import 'package:snackautomat_31_10/produkt.dart';

import 'snack_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SnackNotifier extends StateNotifier<SnackState> {
  SnackNotifier()
      : super(SnackState(
          produkte: Produkt.startbestand,
        ));

  Portemonnaie get getKundenSpeicher => state.kundenSpeicher;

  //ohne Verlust
  void zumKundenHinzufuegen(Muenze muenze) {
    final vorher = state.kundenSpeicher.muenzen;
    final nachher = [...vorher, muenze];
    final newState = state.copyWith(
      kundenSpeicher: () => Portemonnaie(
        nachher,
      ),
    );

    state = newState;
  }

  void vomKundenZumEinwurfHinzufuegen(Muenze muenze) {
    // print(muenze);
    final vorherE = state.einwurf.muenzen;
    final vorherK = state.kundenSpeicher.muenzen;
    //final nachherK = vorherK.where((element) => element != muenze).toList();
    for (int i = 0; i < vorherK.length; i++) {
      if (vorherK[i] == muenze) {
        vorherK.removeAt(i);
        break;
      }
    }
    final nachherK = vorherK;
    final nachherE = [...vorherE, muenze];
    final newState = state.copyWith(
      einwurf: () => Portemonnaie(
        nachherE,
      ),
      kundenSpeicher: () => Portemonnaie(
        nachherK,
      ),
    );

    state = newState;
  }

// kann hieraus meine kaufen funktion herleiten
  void abbrechen() {
    List<Muenze> neueMuenzen =
        state.einwurf.muenzen + state.kundenSpeicher.muenzen;
    final newState = state.copyWith(
        einwurf: () => const Portemonnaie(),
        kundenSpeicher: () => Portemonnaie(
              neueMuenzen,
            ));

    state = newState;
  }

// ich habe eine liste von Münzen in meinem einwurf
// ich habe einen int wert als preis von meinem produkt
// ich muss also den int wert zu einer liste von münzen umwandeln
// und dann die liste von münzen mit der liste von münzen in meinem einwurf vergleichen
// also ob der eiwnurf für den preis des produkts reicht
// wenn ja dann soll das produkt gekauft werden
// eine liste von münzen des preises gelangt in den Automaten
// das gekaufte produkt wird als gekauftes produkt ausgegeben
// und der restbetrag der übrig bleibt gelangt wieder in kundenspeicher gelegt

// also es könnte sowas sein wie
// gehe durch die liste aller münzen die es gibt und vergleiche
// ob der einzelne wert der münzen in den preis der produktes passt
// wenn ja dann füge die münze in eine liste von münzen hinzu
// und ziehe den wert der münze vom preis des produktes ab
// wenn nein dann gehe zur nächsten münze
// wenn die liste von münzen den preis des produktes entspricht dann breche die schleife ab

  void kaufen() {
    print("hha");
    const List<Muenze> muenzenDieEsGibt = [
      Muenze(200),
      Muenze(100),
      Muenze(50),
      Muenze(20),
      Muenze(10),
      Muenze(5),
    ];
    int preisProdukt = state.gewaehltesProdukt!.preis;
    List<Muenze> preisDesProduktesAlsListeVonMuenzen = [];
    for (int i = 0; i <= muenzenDieEsGibt.length - 1; i++) {
      if (preisProdukt == 0) {
        break;
      }
      if (muenzenDieEsGibt[i].wert < preisProdukt) {
        preisDesProduktesAlsListeVonMuenzen.add(muenzenDieEsGibt[i]);
        preisProdukt -= muenzenDieEsGibt[i].wert;
        i = 0;
      } else if (muenzenDieEsGibt[i].wert > preisProdukt) {
        continue;
      }
    }
    if (preisProdukt == 0) {
      final newState = state.copyWith(
        einwurf: () => const Portemonnaie(),
      );
      state = newState;
    }
  }

  void produktWaehlen(Produkt? produkt) {
    final newState = state.copyWith(
      gewaehltesProdukt: () => produkt,
    );
    state = newState;
  }

  /* 
  der eiwnurf ist eine liste von münzen 
  und ich habe einen preis von dem produkt
  ich muss die Münzen mit dem preis vergleichen
  also muss ich eine schleife durch den preis gehen und den preis
  in verschiedene münzen auflösen 
  also 120 wird z.b zu 1 euro und 20 cent münze 
  
    */

// for (p in  )

  // if (state.betragEinwurf >= state.gewaehltesProdukt!.preis) {
  //   final neuerBetrag = state.betragEinwurf - state.gewaehltesProdukt!.preis;

  // final newState =
  //     state.copyWith(state.betragEinwurf: () => const Portemonnaie(neuerBetrag));

//   void produktWaehlen(Produkt? produkt) {
//     final newState = state.copyWith(
//       gewaehltesProdukt: () => produkt,
//     );
//     state = newState;
//   }
// }
}
