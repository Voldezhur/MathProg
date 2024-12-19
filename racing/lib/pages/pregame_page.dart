import 'package:flutter/material.dart';

class PregamePage extends StatefulWidget {
  const PregamePage({super.key});

  @override
  State<PregamePage> createState() => _PregamePageState();
}

class _PregamePageState extends State<PregamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Подготовка игры'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            const Text(
              'Выберите своего игрока:',
              style: TextStyle(fontSize: 20),
            ),
            playerRow('Игрок 1', Colors.blue, 10),
            playerRow('Игрок 2', Colors.red, 30),
            playerRow('Игрок 3', Colors.purple, 50),
            playerRow('Игрок 4', Colors.green, 15),
            playerRow('Игрок 5', Colors.yellow, 30),
          ],
        ),
      ),
    );
  }

  Widget playerRow(String playerName, Color playerColor, int playerSkill) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 0.05,
            height: MediaQuery.sizeOf(context).width * 0.05,
            color: playerColor,
          ),
          Text(playerName),
          Text('Навык игрока: ${playerSkill.toString()}/100'),
        ],
      ),
    );
  }
}
