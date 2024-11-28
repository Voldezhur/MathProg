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
  void _tapTile(index, size) async {
    bool hit = false;

    setState(() {
      // Координаты клетки
      final x = (index / size).floor();
      final y = (index % size).toInt();

      // Флаг попадания

      // Ход игрока
      switch (turn) {
        // Ход первого игрока
        case 1:
          // Если попали
          if (playingField2[x][y].isShip) {
            playingField2Hidden[x][y].isShip = true;
            playingField2Hidden[x][y].isBlownUp = true;
            hit = true;
          } else { // Не попали
            playingField2Hidden[x][y].isMiss = true;
          }
          break;
        // Ход второго игрока
        case 2:
          // Если попали
          if (playingField1[x][y].isShip) {
            playingField1Hidden[x][y].isShip = true;
            playingField1Hidden[x][y].isBlownUp = true;
            hit = true;
          } else { // Не попали
            playingField1Hidden[x][y].isMiss = true;
          }
          break;
      }
    });

    // Если промах - автоматически передать ход следующему игроку
    if (!hit) {
        await Future.delayed(const Duration(seconds: 1));
        _changeTurn();
      }
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
