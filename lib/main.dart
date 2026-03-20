import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculateur_imc/providers/historique_provider.dart';
import 'package:calculateur_imc/screens/imc_calculator.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HistoriqueProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: IMCCalculator());
  }
}
