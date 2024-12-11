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

  void kaufen() {
    // print("hha");
    const List<Muenze> muenzenDieEsGibt = [
      Muenze(200),
      Muenze(100),
      Muenze(50),
      Muenze(20),
      Muenze(10),
      Muenze(5),
    ];
    if (state.gewaehltesProdukt != null) {
      int preisProdukt = state.gewaehltesProdukt!.preis;
      List<Muenze> preisDesProduktesAlsListeVonMuenzen = [];
      if (state.betragEinwurf < preisProdukt) {
        print("nicht genug geld");
      }
      if (state.betragEinwurf == preisProdukt) {
        for (int i = 0; i <= muenzenDieEsGibt.length - 1; i++) {
          if (muenzenDieEsGibt[i].wert <= preisProdukt) {
            preisDesProduktesAlsListeVonMuenzen.add(muenzenDieEsGibt[i]);
            preisProdukt -= muenzenDieEsGibt[i].wert;
            print("komme ich in diese zeile");
            print(muenzenDieEsGibt[i].wert);
            print(preisProdukt);

            i = 0;
          } else if (muenzenDieEsGibt[i].wert > preisProdukt) {
            print("komme ich hier rein");
            continue;
          }
          print(preisDesProduktesAlsListeVonMuenzen);
          if (preisProdukt == 0) {
            final newState = state.copyWith(
              einwurf: () => const Portemonnaie(),
              gekauftesProdukt: () => state.gewaehltesProdukt,
              gewaehltesProdukt: () => Produkt(),
              muenzspeicher: () => Portemonnaie(
                state.muenzspeicher.muenzen +
                    preisDesProduktesAlsListeVonMuenzen,
              ),
            );

            state = newState;
          }
        }
      }

      if (state.betragEinwurf > preisProdukt) {
        {
          int restbetrag = state.betragEinwurf - preisProdukt;
          List<Muenze> betragVomRueckgeld = [];
          List<Muenze> muenzspeicher = state.muenzspeicher.muenzen.toList();
          muenzspeicher.sort((a, b) => b.wert.compareTo(a.wert));

          for (int i = 0; i < muenzspeicher.length; i++) {
            if (muenzspeicher[i].wert <= restbetrag) {
              betragVomRueckgeld.add(muenzspeicher[i]);
              restbetrag -= muenzspeicher[i].wert;
              muenzspeicher.removeAt(i);
              i = 0;
            } else if (muenzspeicher[i].wert > restbetrag) {
              continue;
            }
            print("muenzen: $muenzspeicher");
            if (restbetrag == 0) {
              betragVomRueckgeld = [
                ...state.kundenSpeicher.muenzen,
                ...betragVomRueckgeld,
              ];
              final newState = state.copyWith(
                einwurf: () => const Portemonnaie(),
                gekauftesProdukt: () => state.gewaehltesProdukt,
                gewaehltesProdukt: () => Produkt(),
                kundenSpeicher: () => Portemonnaie(
                  betragVomRueckgeld,
                ),
                muenzspeicher: () => Portemonnaie(muenzspeicher),
              );
              state = newState;
            }
          }
        }
      }
    }
  }

  void produktEntnehmen() {
    final newState = state.copyWith(
      gekauftesProdukt: () => null,
    );
    state = newState;
  }

  void produktWaehlen(Produkt? produkt) {
    final newState = state.copyWith(
      gewaehltesProdukt: () => produkt,
    );
    state = newState;
  }

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

  void einwurfLeeren() {
    final newState = state.copyWith(
      einwurf: () => const Portemonnaie(),
    );
    state = newState;
  }

  void muenzspeicherLeeren() {
    final newState = state.copyWith(
      muenzspeicher: () => const Portemonnaie(),
    );
    state = newState;
  }

  void adminMuenzeHinzufuegen(Muenze muenze) {
    final vorherMuenzspeicher = state.muenzspeicher.muenzen;
    final nachherMuenzspeicher = [...vorherMuenzspeicher, muenze];

    final newState = state.copyWith(
      muenzspeicher: () => Portemonnaie(nachherMuenzspeicher),
    );

    state = newState;
  }
}
