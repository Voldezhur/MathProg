import 'package:battleship/components/field_setting.dart';
import 'package:battleship/globals/playing_fields.dart';
import 'package:flutter/material.dart';

class GamePrep extends StatefulWidget {
  const GamePrep({
    super.key,
    required this.setField1,
    required this.setField2,
    required this.startGame,
    required this.isSingleplayer,
  });

  final Function setField1;
  final Function setField2;
  final Function startGame; // Функция начала игры после выставления всех полей

  final bool isSingleplayer; // Режим игры

  @override
  State<GamePrep> createState() => _GamePrepState();
}

class _GamePrepState extends State<GamePrep> {
  var turn = 1; // Флаг хода, определяет порядок игры

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Игрок $turn',
          style: const TextStyle(fontSize: 24),
        ),
        turn == 1 // В зависимости от хода настраивается первое или второе поле
            ? FieldSetting(
                field: playingField1,
                setField: widget.setField1,
              )
            : FieldSetting(
                field: playingField2,
                setField: widget.setField2,
              ),
        ElevatedButton(
          onPressed: _changeTurn,
          child: const Text('Закончить настраивать поле'),
        ),
      ],
    );
  }
}
