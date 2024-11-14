import 'package:battleship/components/field_setting.dart';
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
  bool settingField = true;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.singleplayer ? 'Одиночная игра' : 'На двоих'),
      ),
      body: settingField
          ? Column(
              children: [
                turn == 1
                    ? FieldSetting(
                        field: playingField1,
                        setField: _setField1,
                      )
                    : FieldSetting(
                        field: playingField2,
                        setField: _setField2,
                      ),
                ElevatedButton(
                  onPressed: () => {turn = turn == 1 ? 2 : 1},
                  child: const Text('Закончить настраивать поле'),
                ),
              ],
            )
          : Gaming(),
    );
  }
}
