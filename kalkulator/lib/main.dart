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
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: const Text(
            'KALKULATOR POSTOTKA',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: const Padding(
          padding: EdgeInsets.all(100.0),
          child: KalkulatorPostotakaForm(),
        ),
      ),
    );
  }
}

class KalkulatorPostotakaForm extends StatefulWidget {
  const KalkulatorPostotakaForm({super.key});

  @override
  _KalkulatorPostotakaFormState createState() =>
      _KalkulatorPostotakaFormState();
}

class _KalkulatorPostotakaFormState extends State<KalkulatorPostotakaForm> {
  final TextEditingController postotakController = TextEditingController();
  final TextEditingController brojController = TextEditingController();
  final TextEditingController dioController = TextEditingController();
  final TextEditingController ukupnoController = TextEditingController();
  final TextEditingController pocetnaVrijednostController = TextEditingController();
  final TextEditingController krajnjaVrijednostController = TextEditingController();

  double? rezultat1;
  double? rezultat2;
  double? rezultat3;
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        forma(
          "Koliko je",
          postotakController,
          brojController,
          "IZRAČUNAJ",
          () {
            setState(() {
              errorMessage = null;
              try {
                double postotak = double.parse(postotakController.text);
                double ukupno = double.parse(brojController.text);
                rezultat1 = (postotak / 100) * ukupno;
              } catch (e) {
                errorMessage = 'Unesite brojčane vrijednosti';
              }
            });
          },
          rezultat1,
          isPercentage: false,
        ),
        const SizedBox(height: 16),
        forma(
          "Koliki postotak je",
          dioController,
          ukupnoController,
          "IZRAČUNAJ",
          () {
            setState(() {
              errorMessage = null;
              try {
                double dio = double.parse(dioController.text);
                double ukupno = double.parse(ukupnoController.text);
                rezultat2 = (dio / ukupno) * 100;
              } catch (e) {
                errorMessage = 'Unesite brojčane vrijednosti';
              }
            });
          },
          rezultat2,
          isPercentage: true,
        ),
        const SizedBox(height: 16),
        forma(
          "Koji je postotak povećanja/smanjenja od",
          pocetnaVrijednostController,
          krajnjaVrijednostController,
          "IZRAČUNAJ",
          () {
            setState(() {
              errorMessage = null;
              try {
                double pocetna = double.parse(pocetnaVrijednostController.text);
                double krajnja = double.parse(krajnjaVrijednostController.text);
                rezultat3 = ((krajnja - pocetna) / pocetna) * 100;
              } catch (e) {
                errorMessage = 'Unesite brojčane vrijednosti';
              }
            });
          },
          rezultat3,
          isPercentage: true,
          promjena: true,  // Dodajemo novi parametar za treću formu
        ),
        if (errorMessage != null) ...[
          const SizedBox(height: 16),
          Text(
            errorMessage!,
            style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ],
      ],
    );
  }

  Widget forma(
    String label,
    TextEditingController controller1,
    TextEditingController controller2,
    String buttonText,
    VoidCallback onCalculate,
    double? result, {
    bool isPercentage = false,
    bool promjena = false,  
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(label),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: controller1,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: '0',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(promjena ? "na" : (isPercentage ? "od" : "% od")), // Promjena teksta
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: controller2,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: '0',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text("?"),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: onCalculate,
                  child: Text(buttonText),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    result != null
                        ? "${result.toStringAsFixed(2)}${isPercentage ? '%' : '.'}"
                        : '0',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
