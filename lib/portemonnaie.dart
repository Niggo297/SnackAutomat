import 'muenze.dart';

class Portemonnaie {
  // static const List<Muenze> listeAllerMuenzenDieEsGibt = [

  //   Muenze(10),
  //   Muenze(20),
  //   Muenze(50),
  //   Muenze(100),
  //   Muenze(200),
  // ];

  final List<Muenze> muenzen;

  const Portemonnaie([this.muenzen = const []]);
  // void geldZumPortemonnaieHinzufuegen(neueMuenzen) {
  //   final geldWasDazuKommt = [...muenzen, ...neueMuenzen];
  //   // muenzen = geldWasDazuKommt;
  //   muenzen => Portemonnaie(
  //      geldWasDazuKommt;
  //   )
  // }

  int get betrag {
    var summe = 0;
    for (final muenze in muenzen) {
      summe = summe + muenze.wert;
    }
    return summe;
  }
}
