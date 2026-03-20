import 'package:flutter/material.dart';
import 'package:calculateur_imc/models/imc.dart';

class Historique extends StatelessWidget {
  final List<Imc> historique;

  const Historique({super.key, required this.historique});

  @override
  Widget build(BuildContext context) {
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
