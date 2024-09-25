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
        body: Center(
          child: Obrazac(),
        ),
      ),
    );
  }
}

class Gumb extends StatelessWidget {
  const Gumb({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          debugPrint('Gumb pritisnut!');
        },
        child: const Text('Potvrdi'));
  }
}

class Obrazac extends StatelessWidget {
  Obrazac({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Unesite svoje ime i prezime",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 32,
          ),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
                labelText: 'Ime', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            controller: surnameController,
            decoration: const InputDecoration(
                labelText: 'Prezime', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () {
                String ime = nameController.text;
                String prezime = surnameController.text;
                debugPrint("Ime $ime, Prezime: $prezime");
              },
              child: Text('Potvrdi'))
        ],
      ),
    );
  }
}
