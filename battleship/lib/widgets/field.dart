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
          return FieldTile(
              tile: widget.field[(index / size).floor()]
                  [(index % size).toInt()]);
        },
      ),
    );
  }
}
