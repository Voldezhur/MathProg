import 'package:flutter/material.dart';
import 'package:knighthood/models/tile_object.dart';
import 'package:knighthood/widgets/tile.dart';

class Field extends StatefulWidget {
  const Field({super.key, required this.size, required this.map});

  final int size; // Размерность карты
  final List<List<TileObject>> map; // Отрисовываемая карта

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.size * widget.size,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.size),
        itemBuilder: (BuildContext context, int index) {
          final size = widget.size;

          // Индекс клетки в списке
          final x = (index / size).floor();
          final y = (index % size).toInt();

          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Tile(tile: widget.map[x][y]),
          );
        },
      ),
    );
  }
}
