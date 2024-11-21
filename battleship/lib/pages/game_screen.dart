import 'package:battleship/components/game_prep.dart';
import 'package:battleship/components/gaming.dart';
import 'package:battleship/globals/lists.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key, required this.singleplayer});

  final bool singleplayer;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool isPrepping = true;
  int turn = 1;

  void _setField1(newField) {
    setState(() {
      playingField1 = newField;
    });
  }

  void _setField2(newField) {
    setState(() {
      playingField2 = newField;
    });
  }

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
              setField1: _setField1,
              setField2: _setField2,
              startGame: _startGame,
              isSingleplayer: widget.singleplayer,
            )
          : Gaming(),
    );
  }
}
