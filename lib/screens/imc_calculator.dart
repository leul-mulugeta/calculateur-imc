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
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 32,
        ),
        child: Column(
          children: [
            Expanded(child: ZoneSaisie()),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.black),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
                overlayColor: WidgetStatePropertyAll(Colors.white24),
                elevation: WidgetStatePropertyAll(4),
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
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1.5),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1.5),
        borderRadius: BorderRadius.circular(14),
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Résultat imc", style: TextStyle(fontSize: 20)),
          Text("24.3", style: TextStyle(fontSize: 34)),
          Text("Normal", style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
