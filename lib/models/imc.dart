class Imc {
  final double _poids;
  final double _taille;

  Imc(this._poids, this._taille);

  double getImc() {
    double tailleEnM = (_taille / 100);
    double imc = _poids / (tailleEnM * tailleEnM);
    return double.parse((imc).toStringAsFixed(1));
  }

  String getCategorie() {
    double imc = getImc();
    if (imc < 16.5) {
      return "Dénutrition";
    } else if (imc < 18.5) {
      return "Maigreur";
    } else if (imc < 25) {
      return "Normal";
    } else if (imc < 30) {
      return "Surpoids";
    } else if (imc < 35) {
      return "Obésité modérée";
    } else if (imc < 40) {
      return "Obésité sévère";
    }
    return "Obésité morbide";
  }
}
