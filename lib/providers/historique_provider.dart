import 'package:flutter/material.dart';
import 'package:calculateur_imc/models/imc.dart';

class HistoriqueProvider extends ChangeNotifier {
  final List<Imc> _historique = [];

  List<Imc> get historique => _historique;

  void add(Imc imc) {
    _historique.add(imc);
    notifyListeners();
  }
}
