import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculateur_imc/providers/historique_provider.dart';
import 'package:calculateur_imc/models/imc.dart';

class Historique extends StatelessWidget {
  const Historique({super.key});

  @override
  Widget build(BuildContext context) {
    final HistoriqueProvider historiqueProvider = context
        .watch<HistoriqueProvider>();
    final List<Imc> historique = historiqueProvider.historique;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Historique", style: TextStyle(fontSize: 30)),
        backgroundColor: Colors.grey[100],
      ),
      body: historique.isEmpty
          ? Center(
              child: Text(
                "Aucun historique pour le moment.",
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView.builder(
              prototypeItem: ListTile(
                title: Text(historique[0].getDate()),
                subtitle: Text(historique[0].getDisplayText()),
                isThreeLine: true,
              ),
              itemCount: historique.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(historique[index].getDate()),
                subtitle: Text(historique[index].getDisplayText()),
                isThreeLine: true,
              ),
            ),
    );
  }
}
