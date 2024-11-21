import 'package:battleship/models/field_item.dart';
import 'package:flutter/material.dart';

class FieldTile extends StatefulWidget {
  const FieldTile({super.key, required this.tile});

  // Клетка, которую нужно отрисовать
  // Берется из списков
  final FieldItem tile;

  @override
  State<FieldTile> createState() => _FieldTileState();
}

class _FieldTileState extends State<FieldTile> {
  @override
  Widget build(BuildContext context) {
    Color color = Colors.white; // Цвет зависит от флагов клетки
    final tile = widget.tile;

    if (tile.isShip) {
      color = Colors.green;
    }

    if (tile.isBlownUp) {
      color = Colors.red;
    }

    if (tile.isMiss) {
      color = Colors.grey;
    }

    return Container(
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.brown),
      ),
    );
  }
}
