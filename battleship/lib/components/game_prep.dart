import 'package:battleship/components/field_setting.dart';
import 'package:battleship/globals/playing_fields.dart';
import 'package:flutter/material.dart';

class GamePrep extends StatefulWidget {
  const GamePrep({
    super.key,
    required this.startGame,
    required this.isSingleplayer,
  });

  final Function startGame; // Функция начала игры после выставления всех полей

  final bool isSingleplayer; // Режим игры

  @override
  State<GamePrep> createState() => _GamePrepState();
}

class _GamePrepState extends State<GamePrep> {
  var turn = 1; // Флаг хода, определяет порядок игры

  // Параметры для расстановки кораблей
  var shipSize = 1;
  var isRotated = true;

  // Выбор размера корабля
  void _setShipSize(int size) {
    setState(() {
      shipSize = size;
    });
  }

  // Передача хода и начало игры, после того, как все игроки закончили подготовку
  void _changeTurn() {
    setState(() {
      switch (turn) {
        case 1:
          if (widget.isSingleplayer) {
            widget.startGame();
          }
          turn++;
          break;
        default:
          widget.startGame();
          break;
      }
    });
  }

  // Очистка активного поля
  void _clearActiveField(number) {
    setState(() {
      switch (number) {
        case 1:
          clearField1();
          break;
        case 2:
          clearField2();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Игрок $turn',
          style: const TextStyle(fontSize: 24),
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () => _setShipSize(1),
              child: const Text('1'),
            ),
            ElevatedButton(
              onPressed: () => _setShipSize(2),
              child: const Text('2'),
            ),
            ElevatedButton(
              onPressed: () => _setShipSize(3),
              child: const Text('3'),
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  isRotated = isRotated ? false : true;
                })
              },
              child: const Icon(Icons.rotate_90_degrees_ccw),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Размер корабля: $shipSize"),
            Text("Поворот: $isRotated"),
          ],
        ),
        turn == 1 // В зависимости от хода настраивается первое или второе поле
            ? FieldSetting(
                field: playingField1,
                shipSize: shipSize,
                isRotated: isRotated,
              )
            : FieldSetting(
                field: playingField2,
                shipSize: shipSize,
                isRotated: isRotated,
              ),
        ElevatedButton(
          onPressed: () => _clearActiveField(turn),
          child: const Text('Очистить поле'),
        ),
        ElevatedButton(
          onPressed: _changeTurn,
          child: const Text('Закончить настраивать поле'),
        ),
      ],
    );
  }
}
