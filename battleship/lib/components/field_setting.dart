import 'package:battleship/models/field_item.dart';
import 'package:battleship/widgets/field.dart';
import 'package:flutter/material.dart';

class FieldSetting extends StatefulWidget {
  const FieldSetting({super.key, required this.field, required this.setField});

  final List<List<FieldItem>> field; // Для вывода поля
  final Function setField; // Для обновления поля

  @override
  State<FieldSetting> createState() => _FieldSettingState();
}

class _FieldSettingState extends State<FieldSetting> {
  // Функция для выставления поля
  void _setTile(index, size) {
    setState(() {
      final x = (index / size).floor();
      final y = (index % size).toInt();

      widget.field[x][y].isShip = true;
      widget.field[x][y].tileColor = Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Возвращаем игровое поле, где при нажатии на клетку в нее поставится корабль
    return Field(
      size: 7,
      field: widget.field,
      tileOnTap: _setTile,
    );
  }
}
