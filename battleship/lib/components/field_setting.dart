import 'package:battleship/models/field_item.dart';
import 'package:battleship/widgets/field.dart';
import 'package:flutter/material.dart';

class FieldSetting extends StatefulWidget {
  const FieldSetting({
    super.key,
    required this.field,
    required this.shipSize,
    required this.isRotated,
  });

  final List<List<FieldItem>> field; // Для вывода поля

  // Параметры для постановки корабля
  final int shipSize;
  final bool isRotated;

  @override
  State<FieldSetting> createState() => _FieldSettingState();
}

class _FieldSettingState extends State<FieldSetting> {
  // Функция для выставления поля
  void _setTile(index, size) {
    setState(() {
      // Координаты корабля
      final x = (index / size).floor();
      final y = (index % size).toInt();

      // widget.field[x][y].isShip = widget.field[x][y].isShip ? false : true;

      final shipSize = widget.shipSize;
      final isRotated = widget.isRotated;

      // Постановка корабля
      switch (isRotated) {
        // Горизонтально
        case false:
          if (x <= size - shipSize) {
            for (int i = 0; i < shipSize; i++) {
              widget.field[x + i][y].isShip = true;
            }
          }
          break;
        // Вертикально
        default:
          if (y <= size - shipSize) {
            for (int i = 0; i < shipSize; i++) {
              widget.field[x][y + i].isShip = true;
            }
          }
          break;
      }
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
