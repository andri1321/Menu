import 'package:flutter/material.dart';
import 'dart:math';


class Loteria extends StatefulWidget {
  const Loteria({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Loteria createState() => _Loteria();
}

class _Loteria extends State<Loteria> {
  final List<int> numbers = List.generate(38, (index) => index + 1);
  List<int> selectedNumbers = [];

  void generateRandomNumbers() {
    var random = Random();
    selectedNumbers.clear();

    while (selectedNumbers.length < 6) {
      int randomNumber = random.nextInt(38) + 1;
      if (!selectedNumbers.contains(randomNumber)) {
        selectedNumbers.add(randomNumber);
      }
    }

    setState(() {});
  }

  void clearSelectedNumbers() {
    selectedNumbers.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text('Loteria nacional (Loteka)'),
        backgroundColor: Colors.blue[400],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 10,
                children: numbers.map((number) {
                  return Card(
                    child: Center(
                      child: Text('$number'),
                    ),
                  );
                }).toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    generateRandomNumbers();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    elevation: 2,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Text(
                      'Quiero Jugar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    clearSelectedNumbers();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    elevation: 2,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Eliminar Jugada',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            // Seis números aleatorios
            const SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.center,
              children: selectedNumbers.map((number) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    color: const Color.fromARGB(255, 79, 137, 238),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        '$number',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}