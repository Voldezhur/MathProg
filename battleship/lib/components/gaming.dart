import 'package:battleship/globals/playing_fields.dart';
import 'package:battleship/pages/game_over_screen.dart';
import 'package:battleship/widgets/field.dart';
import 'package:flutter/material.dart';

class Gaming extends StatefulWidget {
  const Gaming({super.key});

  @override
  State<Gaming> createState() => _GamingState();
}

class _GamingState extends State<Gaming> {
  var turn = 1; // Номер хода
  bool isInitialized = true; // Флаг для изначальной настройки количества кораблей

  // Количество оставшихся кораблей у игроков
  var shipCount1 = 0;
  var shipCount2 = 0;

  int _countShips(int fieldNum) {
    var counter = 0;

    var field = fieldNum == 1 ? playingField1 : playingField2;

    for (var i in field) {
      for (var ii in i) {
        if (ii.isShip) {
          counter++;
        }
      }
    }

    return counter;
  }

  // Передача хода и начало игры, после того, как все игроки закончили подготовку
  void _changeTurn() {
    setState(() {
      turn = turn == 1 ? 2 : 1;
    });
  }

  // Конец игры
  void _finishGame(player) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GameOverScreen(player: player),
      ),
    );
  }

  // Нажатие на клетку
  void _tapTile(index, size) async {
    bool hit = false;

    setState(() {
      // Координаты клетки
      final x = (index / size).floor();
      final y = (index % size).toInt();

      // Ход игрока
      switch (turn) {
        // Ход первого игрока
        case 1:
          // Если попали
          if (playingField2[x][y].isShip) {
            // Устанавливаем флаги для клетки
            playingField2Hidden[x][y].isShip = true;
            playingField2Hidden[x][y].isBlownUp = true;
            hit = true; // Попали
            shipCount2--; // Убавляем количество кораблей у противника
          } else { // Не попали
            playingField2Hidden[x][y].isMiss = true;
          }
          break;
        // Ход второго игрока
        case 2:
          // Если попали
          if (playingField1[x][y].isShip) {
            // Устанавливаем флаги для клетки
            playingField1Hidden[x][y].isShip = true;
            playingField1Hidden[x][y].isBlownUp = true;
            // Попали
            hit = true;
            // Убавляем количество кораблей у противника
            shipCount1--;
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

    // Проверка на финал игры
    // Победил первый игрок
    if (shipCount2 <= 0) {
      await Future.delayed(const Duration(seconds: 1));
      _finishGame(1);
    }
    // Победил второй игрок
    if (shipCount1 <= 0) {
      await Future.delayed(const Duration(seconds: 1));
      _finishGame(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Количество оставшихся кораблей у игроков
    if (isInitialized) {
      shipCount1 = _countShips(1);
      shipCount2 = _countShips(2);

      isInitialized = false;
    }

    return Scaffold(
      body: Column(
        children: [
          Text('Игрок $turn'),
          Text('Кораблей осталось у игрока ${turn == 1 ? 2 : 1}: ${turn == 1 ? shipCount2: shipCount1}'),
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
