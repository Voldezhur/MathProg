import 'package:flutter/material.dart';
import 'package:racing/consts/players.dart';
import 'package:racing/models/player.dart';
import 'package:racing/pages/game_page.dart';

class PregamePage extends StatefulWidget {
  const PregamePage({super.key});

  @override
  State<PregamePage> createState() => _PregamePageState();
}

class _PregamePageState extends State<PregamePage> {
  // Выбор игрока
  void _selectPlayer(Player player) {
    currentPlayer = player;
    Navigator.push(context, MaterialPageRoute(builder: (context) => const GamePage()));
  }

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
            Expanded(
              child: ListView.builder(
                itemCount: players.length,
                itemBuilder: (BuildContext context, int index) {
                  return playerRow(players[index].name, players[index].color, players[index].skill);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  // Отрисовка игрока в списке
  Widget playerRow(String playerName, Color playerColor, int playerSkill) {
    return GestureDetector(
      onTap: () => _selectPlayer(players.firstWhere((player) => player.name == playerName)),
      child: Container(
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
      ),
    );
  }
}
