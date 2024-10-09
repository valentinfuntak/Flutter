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

class Obrazac extends StatefulWidget {
  const Obrazac({super.key});

  @override
  _ObrazacState createState() => _ObrazacState();
}

class _ObrazacState extends State<Obrazac> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    super.dispose();
  }

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

class PrikazPodataka extends StatefulWidget {
  final String ime;
  final String prezime;

  const PrikazPodataka({required this.ime, required this.prezime, super.key});

  @override
  State<PrikazPodataka> createState() => _PrikazPodatakaState();
}

class _PrikazPodatakaState extends State<PrikazPodataka> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prikaz podataka"),
      ),
    );
  }
}
