import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hod kockou',
      theme: ThemeData(colorSchemeSeed: Colors.indigo),
      home: const DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  final random = Random();
  int diceNumber = 1;

  void rollDice() {
    setState(() {
      diceNumber = random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hod kockou')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/dice-$diceNumber.png',
              width: 200,
              height: 200,
              semanticLabel: 'Kocka: $diceNumber',
            ),
            const SizedBox(height: 24),
            Text('Padlo: $diceNumber', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: rollDice,
              child: const Text('Hodiť kockou'),
            ),
          ],
        ),
      ),
    );
  }
}
