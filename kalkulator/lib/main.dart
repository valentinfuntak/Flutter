import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kalkulator postotaka'),
        ),
        body: KalkulatorPostotakaForm(),
      ),
    );
  }
}

class KalkulatorPostotakaForm extends StatefulWidget {
  @override
  _KalkulatorPostotakaFormState createState() =>
      _KalkulatorPostotakaFormState();
}

class _KalkulatorPostotakaFormState extends State<KalkulatorPostotakaForm> {
  final TextEditingController postotakController = TextEditingController();
  final TextEditingController ukupnoController = TextEditingController();
  final TextEditingController dioController = TextEditingController();
  final TextEditingController pocetnaVrijednostController =
      TextEditingController();
  final TextEditingController krajnjaVrijednostController =
      TextEditingController();

  double? rezultatPostotka;
  double? postotakDijela;
  double? promjenaPodataka;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(children: [
        buildRow(context, "Koliko je X% od Y?",
        postotakController,
        ukupnoController,"Izračunaj", (){
          setState(() {
            double postotak = double.parse(postotakController.text);
            double total = double.parse(ukupnoController.text);
            rezultatPostotka = (postotak / 100) * ukupno;
          });
        })
      ],),
    )
  }
}
