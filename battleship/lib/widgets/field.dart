import 'package:battleship/models/field_item.dart';
import 'package:battleship/widgets/field_tile.dart';
import 'package:flutter/material.dart';

class Field extends StatefulWidget {
  const Field({super.key, required this.size, required this.field});

  final size;
  final List<List<FieldItem>> field;

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  void _setTile(index) {
    setState(() {
      final size = widget.size;
      final x = (index / size).floor();
      final y = (index % size).toInt();

      widget.field[x][y].isShip = true;
      widget.field[x][y].tileColor = Colors.green;
    });
  }

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
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: InkWell(
              onTap: () => _setTile(index),
              child: FieldTile(
                  tile: widget.field[(index / size).floor()]
                      [(index % size).toInt()]),
            ),
          );
        },
      ),
    );
  }
}
