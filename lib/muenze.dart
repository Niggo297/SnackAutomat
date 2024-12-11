class Muenze {
  final int wert;

  const Muenze(this.wert);

  void anzeigen() {
    print('Wert: $wert');
  }

  @override
  String toString() {
    return 'Muenze{wert: $wert}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Muenze && other.wert == wert;
  }

  @override
  int get hashCode {
    return wert.hashCode;
  }
}
