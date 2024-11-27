import 'package:battleship/components/game_prep.dart';
import 'package:battleship/components/gaming.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key, required this.singleplayer});

  final bool singleplayer; // Определяет режим игры

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool isPrepping = true; // Флаг начала игры

  void _startGame() {
    setState(() {
      isPrepping = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.singleplayer ? 'Одиночная игра' : 'На двоих'),
      ),
      body: isPrepping
          ? GamePrep(
              startGame: _startGame,
              isSingleplayer: widget.singleplayer,
            )
          : Gaming(),
    );
  }
}
