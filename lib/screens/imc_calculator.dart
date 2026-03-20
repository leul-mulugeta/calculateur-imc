import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculateur_imc/providers/historique_provider.dart';
import 'package:calculateur_imc/models/imc.dart';
import 'package:calculateur_imc/screens/historique.dart';

class IMCCalculator extends StatefulWidget {
  const IMCCalculator({super.key});

  @override
  State<IMCCalculator> createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
  double _imc = 0;
  String _categorie = "";

  final TextEditingController _poidsTextEditingController =
      TextEditingController();
  final TextEditingController _tailleTextEditingController =
      TextEditingController();

  @override
  void dispose() {
    _poidsTextEditingController.dispose();
    _tailleTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text("Calculateur d'IMC", style: TextStyle(fontSize: 30)),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Historique()),
            ),
            icon: Icon(Icons.history),
          ),
        ],
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
            Expanded(
              child: ZoneSaisie(
                poidsTextEditingController: _poidsTextEditingController,
                tailleTextEditingController: _tailleTextEditingController,
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                // Fermer le clavier
                FocusScope.of(context).unfocus();
                calculerIMC(context);
              },
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
            Expanded(
              child: ZoneInfo(imc: _imc, categorie: _categorie),
            ),
          ],
        ),
      ),
    );
  }

  void calculerIMC(BuildContext context) {
    // Récupérer les valeurs depuis la zone de saisie et convertir en double
    double? poids = double.tryParse(_poidsTextEditingController.text);
    double? taille = double.tryParse(_tailleTextEditingController.text);

    final HistoriqueProvider historiqueProvider = context
        .read<HistoriqueProvider>();

    if (poids != null && taille != null) {
      if (poids <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Veuillez fournir une valeur de poids positive."),
          ),
        );
      } else if (taille <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Veuillez fournir une valeur de taille positive."),
          ),
        );
      } else {
        Imc imc = Imc(poids, taille, DateTime.now());
        historiqueProvider.add(imc);

        setState(() {
          _imc = imc.getImc();
          _categorie = imc.getCategorie();
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Veuillez fournir le poids et la taille.")),
      );
    }
  }
}

class ZoneSaisie extends StatelessWidget {
  final TextEditingController poidsTextEditingController;
  final TextEditingController tailleTextEditingController;

  const ZoneSaisie({
    super.key,
    required this.poidsTextEditingController,
    required this.tailleTextEditingController,
  });

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
              controller: poidsTextEditingController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 50),
            Text("Taille (cm)"),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
              controller: tailleTextEditingController,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}

class ZoneInfo extends StatelessWidget {
  final double imc;
  final String categorie;

  const ZoneInfo({super.key, required this.imc, required this.categorie});

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
          Text(imc.toString(), style: TextStyle(fontSize: 34)),
          Text(categorie, style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
