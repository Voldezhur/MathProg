import 'package:battleship/globals/playing_fields.dart';
import 'package:battleship/widgets/field.dart';
import 'package:flutter/material.dart';

class Gaming extends StatefulWidget {
  const Gaming({super.key});

  @override
  State<Gaming> createState() => _GamingState();
}

class _GamingState extends State<Gaming> {
  var turn = 1;

  // Передача хода и начало игры, после того, как все игроки закончили подготовку
  void _changeTurn() {
    setState(() {
      turn = turn == 1 ? 2 : 1;
    });
  }

  // Нажатие на клетку
  void _tapTile(index, size) {
    setState(() {
      // Координаты клетки
      final x = (index / size).floor();
      final y = (index % size).toInt();

      switch (turn) {
        // Ход первого игрока
        case 1:
          if (playingField2[x][y].isShip) {
            playingField2Hidden[x][y].isShip = true;
            playingField2Hidden[x][y].isBlownUp = true;
          } else {
            playingField2Hidden[x][y].isMiss = true;
          }
          break;
        // Ход второго игрока
        case 2:
          if (playingField1[x][y].isShip) {
            playingField1Hidden[x][y].isShip = true;
            playingField1Hidden[x][y].isBlownUp = true;
          } else {
            playingField1Hidden[x][y].isMiss = true;
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Игрок $turn'),
          turn == 1 // В зависимости от хода настраивается первое или второе поле
              ? Field(
                  size: 7,
                  field: playingField2Hidden,
                  tileOnTap: _tapTile,
                )
              : Field(
                  size: 7,
                  field: playingField1Hidden,
                  tileOnTap: _tapTile,
                ),
          ElevatedButton(
            onPressed: _changeTurn,
            child: const Text('Закончить ход'),
          ),
        ],
      ),
    );
  }
}
