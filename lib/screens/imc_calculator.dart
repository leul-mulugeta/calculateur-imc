import 'package:flutter/material.dart';

class IMCCalculator extends StatelessWidget {
  const IMCCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text("Calculateur d'IMC", style: TextStyle(fontSize: 30)),
        ),
        backgroundColor: Colors.grey[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(child: ZoneSaisie()),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                // Il faut savoir gérer l'animation car je change la couleur
                // backgroundColor: WidgetStatePropertyAll(Colors.black),
                // foregroundColor: WidgetStatePropertyAll(Colors.white),
                elevation: WidgetStatePropertyAll(4.0),
                minimumSize: WidgetStatePropertyAll(Size(125, 50)),
              ),
              child: Text("Calculer"),
            ),
            SizedBox(height: 25),
            Expanded(child: ZoneInfo()),
          ],
        ),
      ),
    );
  }
}

class ZoneSaisie extends StatelessWidget {
  final _poidsTextEditingController = TextEditingController();
  final _tailleTextEditingController = TextEditingController();

  ZoneSaisie({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 45.0),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Poids (Kg)"),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
              controller: _poidsTextEditingController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 50),
            Text("Taille (cm)"),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
              controller: _tailleTextEditingController,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}

class ZoneInfo extends StatelessWidget {
  const ZoneInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [BoxShadow(color: Colors.black)],
      ),
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Résultat imc"),
          Text("24.3"),
          Text("Normal"),
        ],
      ),
    );
  }
}
