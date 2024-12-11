import 'package:snackautomat_31_10/muenze.dart';

import 'produkt.dart';
import 'portemonnaie.dart';

class SnackState {
  List<Produkt> produkte;
  Produkt? gewaehltesProdukt;
  Produkt? gekauftesProdukt;
  Portemonnaie einwurf;
  Portemonnaie muenzspeicher;
  Portemonnaie kundenSpeicher;
  int get betragEinwurf => einwurf.betrag;
  int get betragKundenSpeicher => kundenSpeicher.betrag;
  int get betragMuenzspeicher => muenzspeicher.betrag;

  // Portemonnaie get getKundenSpeicher => kundenSpeicher;

  // get sorgt dafür, dass Variablen von außen aufrufbar sind
  // aber auf die Variable innerhalb der Klasse zugreifen
  // beispiel Portemonnaie getKundenSpeicher(){ return kundenSpeicher}

  SnackState({
    this.gekauftesProdukt,
    this.einwurf = const Portemonnaie(),
    this.muenzspeicher = const Portemonnaie(
      [
        Muenze(5),
        Muenze(5),
        Muenze(10),
        Muenze(10),
        Muenze(10),
        Muenze(20),
        Muenze(20),
        Muenze(50),
        Muenze(50),
        Muenze(100),
        Muenze(100),
        Muenze(200),
      ],
    ),
    this.produkte = const [],
    this.gewaehltesProdukt,
    this.kundenSpeicher = const Portemonnaie([
      // Muenze(5),
      // Muenze(10),
      // Muenze(20),
      // Muenze(20),
      // Muenze(50),
      // Muenze(100),
      // Muenze(200),
      // Muenze(10),
      // Muenze(20),
      // Muenze(50),
      // Muenze(100),
      // Muenze(200),
    ]),
  });
// andreas Fragen
  SnackState copyWith({
    List<Produkt> Function()? produkte,
    Portemonnaie Function()? einwurf,
    Portemonnaie Function()? muenzspeicher,
    Produkt? Function()? gewaehltesProdukt,
    Portemonnaie Function()? kundenSpeicher,
    Produkt? Function()? gekauftesProdukt,
  }) =>
      SnackState(
        produkte: produkte != null ? produkte() : this.produkte,
        einwurf: einwurf != null ? einwurf() : this.einwurf,
        muenzspeicher:
            muenzspeicher != null ? muenzspeicher() : this.muenzspeicher,
        gewaehltesProdukt: gewaehltesProdukt != null
            ? gewaehltesProdukt()
            : this.gewaehltesProdukt,
        gekauftesProdukt: gekauftesProdukt != null
            ? gekauftesProdukt()
            : this.gekauftesProdukt,
        kundenSpeicher:
            kundenSpeicher != null ? kundenSpeicher() : this.kundenSpeicher,
      );
}
