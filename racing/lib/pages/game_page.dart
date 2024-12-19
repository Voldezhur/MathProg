import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:racing/consts/players.dart';
import 'package:racing/models/player.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int rotation = 0; // Поворот

  Timer? timer; // Таймер, отвечающий за повороты
  List<Widget> racingPlayers = []; // Список виджетов для Stack

  // Создание списка игроков
  @override
  void initState() {
    super.initState();
    for (var player in players) {
      racingPlayers.add(playerRacing(player));
    }
  }

  // Начало гонки - таймер включается
  void _startRace() {
    timer = Timer.periodic(const Duration(milliseconds: 10), (Timer t) {
      setState(() {
        rotation += 3;
      });
    });
  }

  // Остановка гонки - удаляем таймер
  void _stopRace() {
    timer?.cancel();
  }

  // При выходе - удаляем таймер
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Text('Игрок - '),
            Container(
              color: currentPlayer.color,
              width: MediaQuery.sizeOf(context).width * 0.05,
              height: MediaQuery.sizeOf(context).width * 0.05,
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              // children: racingPlayers,
              children: [
                playerRacing(players[0]),
                playerRacing(players[1]),
                playerRacing(players[2]),
                playerRacing(players[3]),
                playerRacing(players[4]),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: _startRace,
                  child: const Text('Начать гонку'),
                ),
                ElevatedButton(
                  onPressed: _stopRace,
                  child: const Text('Остановить гонку'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Игрок на гоночном треке
  Widget playerRacing(Player player) {
    var _random = new Random();
    int next(int min, int max) => min + _random.nextInt(max - min);

    int x = next(5, player.skill);

    return RotationTransition(
      turns: AlwaysStoppedAnimation((rotation + x) / 360),
      child: SizedBox(
        // width: MediaQuery.sizeOf(context).width * 0.2,
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: player.color,
              // width: MediaQuery.sizeOf(context).width * 0.05,
              // height: MediaQuery.sizeOf(context).width * 0.05,
              width: 25,
              height: 25,
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
