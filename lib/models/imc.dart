import 'package:intl/intl.dart';

class Imc {
  final double _poids;
  final double _taille;
  final DateTime _date;

  Imc(this._poids, this._taille, this._date);

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

  String getDate() {
    return DateFormat("d MMMM yyyy").format(_date);
  }

  String getDisplayText() {
    return 'IMC: ${getImc()}, Categorie: ${getCategorie()}\nPoids: $_poids, Taille: $_taille';
  }
}
