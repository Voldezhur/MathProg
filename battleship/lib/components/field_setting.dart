import 'package:battleship/models/field_item.dart';
import 'package:battleship/widgets/field.dart';
import 'package:flutter/material.dart';

class FieldSetting extends StatefulWidget {
  const FieldSetting({
    super.key,
    required this.field,
    required this.shipSize,
    required this.isRotated,
    required this.addShip,
  });

  final List<List<FieldItem>> field; // Для вывода поля

  // Параметры для постановки корабля
  final int shipSize;
  final bool isRotated;

  // Функция для добавления корабля в бюджет
  final Function addShip;

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

      // Данные о корабле
      final shipSize = widget.shipSize;
      final isRotated = widget.isRotated;

      // Постановка корабля
      try {
        switch (isRotated) {
          // Горизонтально
          case false:
            if (x <= size - shipSize) {
              // Проверка, что корабль не пересекается с другим
              for (int i = 0; i < shipSize; i++) {
                if (widget.field[x + i][y].isShip) {
                  throw ('Корабль пересекает другой корабль');
                }
              }
              // Расположение корабля
              widget.addShip(shipSize);
              for (int i = 0; i < shipSize; i++) {
                widget.field[x + i][y].isShip = true;
              }
            } else {
              throw ('Корабль пересекает границу поля');
            }
            break;
          // Вертикально
          default:
            if (y <= size - shipSize) {
              // Проверка, что корабль не пересекается с другим
              for (int i = 0; i < shipSize; i++) {
                if (widget.field[x][y + i].isShip) {
                  throw ('Корабль пересекает другой корабль');
                }
              }
              // Расположение корабля
              widget.addShip(shipSize);
              for (int i = 0; i < shipSize; i++) {
                widget.field[x][y + i].isShip = true;
              }
            } else {
              throw ('Корабль пересекает границу поля');
            }
            break;
        }
      } catch (e) {
        var snackBar = SnackBar(
          content: Text(e.toString()),
          duration: const Duration(seconds: 2),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
