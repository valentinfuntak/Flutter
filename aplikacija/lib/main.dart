import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  const Obrazac({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
