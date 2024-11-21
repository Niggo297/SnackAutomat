class Produkt {
  static List<Produkt> startbestand = [
    Produkt(
      name: 'CapriSun',
      preis: 120,
      id: 1,
      verfuegbareProdukte: 10,
      bild: 'assets/images/capriSun.jpg',
    ),
    Produkt(
      name: 'Mars',
      preis: 130,
      id: 2,
      verfuegbareProdukte: 5,
      bild: 'assets/images/capriSun.jpg',
    ),
    Produkt(
      name: 'Fanta zero',
      preis: 250,
      id: 3,
      verfuegbareProdukte: 2,
      bild: 'assets/images/skittles.jpg',
    ),
    Produkt(
      name: 'Fanta zero',
      preis: 250,
      id: 3,
      verfuegbareProdukte: 2,
      bild: 'assets/images/skittles.jpg',
    ),
    Produkt(
      name: 'Fanta zero',
      preis: 250,
      id: 3,
      verfuegbareProdukte: 2,
      bild: 'assets/images/skittles.jpg',
    ),
    Produkt(
      name: 'Fanta zero',
      preis: 250,
      id: 3,
      verfuegbareProdukte: 2,
      bild: 'assets/images/skittles.jpg',
    ),
    Produkt(
      name: 'Fanta zero',
      preis: 250,
      id: 3,
      verfuegbareProdukte: 2,
      bild: 'assets/images/skittles.jpg',
    ),
    Produkt(
      name: 'Fanta zero',
      preis: 250,
      id: 3,
      verfuegbareProdukte: 2,
      bild: 'assets/images/skittles.jpg',
    ),
  ];

  String name;
  int preis;
  int id;
  int verfuegbareProdukte;
  String bild;
  Produkt({
    this.name = "",
    this.preis = 100,
    this.id = 0,
    this.verfuegbareProdukte = 1,
    this.bild = 'assets/images/snickers.jpg',
  });

  void infoAusgeben() {
    print(
        'Name: $name, Preis: $preis Euro, ID: $id, VerfuegbareProdukte: $verfuegbareProdukte');
  }
}
