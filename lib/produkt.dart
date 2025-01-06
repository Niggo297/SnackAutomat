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
      name: 'Bounty',
      preis: 130,
      id: 2,
      verfuegbareProdukte: 5,
      bild: 'assets/images/bounty.jpg',
    ),
    Produkt(
      name: 'Skittles',
      preis: 210,
      id: 3,
      verfuegbareProdukte: 2,
      bild: 'assets/images/skittles.jpg',
    ),
    Produkt(
      name: 'twix',
      preis: 250,
      id: 3,
      verfuegbareProdukte: 2,
      bild: 'assets/images/twix.jpg',
    ),
    Produkt(
      name: 'Proteinriegel',
      preis: 350,
      id: 3,
      verfuegbareProdukte: 2,
      bild: 'assets/images/proteinbar.jpg',
    ),
    Produkt(
      name: 'Nutella',
      preis: 750,
      id: 3,
      verfuegbareProdukte: 2,
      bild: 'assets/images/nutella.jpg',
    ),
    Produkt(
      name: 'Red-bull',
      preis: 250,
      id: 3,
      verfuegbareProdukte: 2,
      bild: 'assets/images/Red-bull.jpg',
    ),
    Produkt(
      name: 'Powerrade',
      preis: 250,
      id: 3,
      verfuegbareProdukte: 2,
      bild: 'assets/images/powerrade.jpg',
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
