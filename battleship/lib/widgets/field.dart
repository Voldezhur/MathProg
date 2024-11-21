import 'package:battleship/models/field_item.dart';
import 'package:battleship/widgets/field_tile.dart';
import 'package:flutter/material.dart';

class Field extends StatefulWidget {
  const Field(
      {super.key,
      required this.size,
      required this.field,
      required this.tileOnTap});

  final int size; // Размерность поля
  final List<List<FieldItem>> field; // Поле, которое выводится на экран
  final Function tileOnTap; // Функция, вызываемая при нажатии на клетку

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
            child: InkWell(
              onTap: () => widget.tileOnTap(index, size),
              child: FieldTile(tile: widget.field[x][y]),
            ),
          );
        },
      ),
    );
  }
}
