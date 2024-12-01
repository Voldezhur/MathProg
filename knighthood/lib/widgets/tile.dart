import 'package:flutter/material.dart';
import 'package:knighthood/globals/settings.dart';
import 'package:knighthood/models/tile_object.dart';

class Tile extends StatefulWidget {
  const Tile({super.key, required this.tile});

  final TileObject tile;

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    // Цвет клетки зависит от флагов объекта из списка
    Color tileColor = Colors.white;

    // Выбор цвета
    // Свободная клетка
    if (widget.tile.isFree) {
      tileColor = Colors.white;
    }
    // Стена
    if (widget.tile.isWall) {
      tileColor = Colors.black;
    }
    // Дверь
    if (widget.tile.isDoor) {
      tileColor = Colors.brown;
    }
    // Кабан
    if (widget.tile.isBoar) {
      tileColor = Colors.red;
    }
    // Игрок - отрисовывается последним
    if (widget.tile.isPlayer) {
      // Цвет берется из настроек
      tileColor = playerColor;
    }

    return Container(
      decoration: BoxDecoration(
        color: tileColor,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
    );
  }
}
