import 'package:battleship/components/field_setting.dart';
import 'package:battleship/components/gaming.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key, required this.singleplayer});

  final bool singleplayer;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<List<int>> playingField1 = [[]];
  List<List<int>> playingField2 = [[]];

  bool settingField = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.singleplayer ? 'Одиночная игра' : 'На двоих'),
      ),
      body: settingField ? FieldSetting() : Gaming(),
    );
  }
}
