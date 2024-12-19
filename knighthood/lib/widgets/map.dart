import 'package:flutter/material.dart';
import 'package:knighthood/models/tile_object.dart';
import 'package:knighthood/widgets/tile.dart';

class Map extends StatefulWidget {
  const Map({
    super.key,
    required this.size,
    required this.map,
    required this.tileOnTap,
  });

  final int size; // Размерность карты
  final List<List<TileObject>> map; // Отрисовываемая карта
  final Function
      tileOnTap; // Функция при нажатии на клетку (обязательны параметры x, y)

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
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

          return Tile(
            tile: widget.map[x][y],
            tileOnTap: () => {widget.tileOnTap(x, y)},
          );
        },
      ),
    );
  }
}
