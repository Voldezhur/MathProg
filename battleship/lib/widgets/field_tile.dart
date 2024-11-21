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
    return Container(
      decoration: BoxDecoration(
          color: widget.tile.tileColor,
          border: Border.all(color: Colors.brown)),
    );
  }
}
